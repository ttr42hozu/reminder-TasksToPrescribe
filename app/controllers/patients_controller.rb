class PatientsController < ApplicationController
  def index
    @patients = Patient.all.includes(:medicines)
  end

  def new
    @patient_medicine = PatientMedicine.new
  end

  def create
    @patient_medicine = PatientMedicine.new(patient_medicine_params)
    if @patient_medicine.valid?
      @patient_medicine.save
      redirect_to root_path
    else 
      render action: :new
    end
  end

  private
  
  def patient_medicine_params
    params.require(:patient_medicine).permit(:image, :medical_record_number, :last_name, :first_name, :start_day, :name, :usage_id, :dose_id, :day_id).merge(user_id: current_user.id)
  end
end
