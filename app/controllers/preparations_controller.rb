class PreparationsController < ApplicationController
  def create
    @preparation = Preparation.new(preparation_params)
    if @preparation.valid?
      @preparation.save
      redirect_to root_path
    else
      render root_path
    end
  end

  def destroy
    @preparation = Preparation.find(params[:id])
    @medicine = Medicine.find(@preparation.medicine.id)
    @patient = Patient.find(params[:patient_id])
    if current_user.id == @preparation.user.id
      @preparation.destroy
      @medicine.destroy
      @patient.destroy
    end
    redirect_to root_path
  end
  
  def update
    @preparation = Preparation.find(params[:id])
    @medicine = Medicine.find(@preparation.medicine.id)
    if current_user.id == @preparation.user.id
      @preparation.destroy
      @medicine.update(start_day: @medicine.start_day + @medicine.day.name)
    end
    redirect_to root_path
  end

  private
  
  def preparation_params
    params.permit(:medicine_id).merge(user_id: current_user.id)
  end
end
