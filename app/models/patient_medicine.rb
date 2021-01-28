class PatientMedicine
  include ActiveModel::Model
  attr_accessor :image, :medical_record_number, :last_name, :first_name, :user_id, :name, :usage_id, :dose_id, :day_id, :start_day, :patient_id

  with_options presence: true do
    validates :medical_record_number, format: {with: /\A\d+-\d+\z/}
    validates :last_name
    validates :first_name
    validates :user_id
    validates :name
    validates :usage_id, numericality: {other_than: 1}
    validates :dose_id, numericality: {other_than: 1}
    validates :day_id, numericality: {other_than: 1}
    validates :start_day
    validates :patient_id
  end

  def save
    patient = Patient.create(image: image, medical_record_number: medical_record_number, last_name: last_name, first_name: first_name, user_id: user_id)
    Medicine.create(name: name, usage_id: usage_id, dose_id: dose_id, day_id: day_id, start_day: start_day, patient_id: patient.id)
  end
end