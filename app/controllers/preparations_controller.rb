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
    unless current_user.id == @preparation.user.id
      redirect_to root_path
    end
    @preparation.destroy
  end
  private
  
  def preparation_params
    params.permit(:medicine_id).merge(user_id: current_user.id)
  end
end
