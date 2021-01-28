require 'rails_helper'

RSpec.describe PatientMedicine, type: :model do
  before do
    user = FactoryBot.create(:user)
    patient = FactoryBot.create(:patient, user_id: user.id)
    # FactoryBot.create(:medicine, patient_id: patient.id)
    @patient_medicine = FactoryBot.build(:patient_medicine, user_id: user.id, patient_id: patient.id)
  end
  context '登録できる場合' do
    it 'medicine_record_number, last_name, first_name, user_id, name, medical_record_number, usage_id, dose_id, day_id, start_day, patient_idが存在すれば登録できる' do
      expect(@patient_medicine).to be_valid
    end
  end
  context '登録できない場合' do
    it 'medicine_record_numberが空の場合、登録できない' do
      @patient_medicine.medical_record_number = nil
      @patient_medicine.valid?
      expect(@patient_medicine.errors.full_messages).to include("Medical record number can't be blank")
    end

    it 'medicine_record_numberに-が含まれていない場合、登録できない' do
      @patient_medicine.medical_record_number = '01234'
      @patient_medicine.valid?
      expect(@patient_medicine.errors.full_messages).to include("Medical record number is invalid")
    end

    it 'medicine_record_numberが全角数字の場合、登録できない' do
      @patient_medicine.medical_record_number = '０１２３-４'
      @patient_medicine.valid?
      expect(@patient_medicine.errors.full_messages).to include("Medical record number is invalid")
    end

    it 'medicine_record_numberが半角数字でない場合、登録できない' do
      @patient_medicine.medical_record_number = 'abcd-a'
      @patient_medicine.valid?
      expect(@patient_medicine.errors.full_messages).to include("Medical record number is invalid")
    end

    it 'last_nameが空の場合、登録できない' do
      @patient_medicine.last_name = nil
      @patient_medicine.valid?
      expect(@patient_medicine.errors.full_messages).to include("Last name can't be blank")
    end

    it 'first_nameが空の場合、登録できない' do
      @patient_medicine.first_name = nil
      @patient_medicine.valid?
      expect(@patient_medicine.errors.full_messages).to include("First name can't be blank")
    end

    it 'user_idが空の場合、登録できない' do
      @patient_medicine.user_id = nil
      @patient_medicine.valid?
      expect(@patient_medicine.errors.full_messages).to include("User can't be blank")
    end

    it 'nameが空の場合、登録できない' do
      @patient_medicine.name = nil
      @patient_medicine.valid?
      expect(@patient_medicine.errors.full_messages).to include("Name can't be blank")
    end

    it 'usage_idが空の場合、登録できない' do
      @patient_medicine.usage_id = nil
      @patient_medicine.valid?
      expect(@patient_medicine.errors.full_messages).to include("Usage can't be blank")
    end

    it 'usage_idが1の場合、登録できない' do
      @patient_medicine.usage_id = 1
      @patient_medicine.valid?
      expect(@patient_medicine.errors.full_messages).to include("Usage must be other than 1")
    end

    it 'dose_idが空の場合、登録できない' do
      @patient_medicine.dose_id = nil
      @patient_medicine.valid?
      expect(@patient_medicine.errors.full_messages).to include("Dose can't be blank")
    end

    it 'dose_idが1の場合、登録できない' do
      @patient_medicine.dose_id = 1
      @patient_medicine.valid?
      expect(@patient_medicine.errors.full_messages).to include("Dose must be other than 1")
    end

    it 'day_idが空の場合、登録できない' do
      @patient_medicine.day_id = nil
      @patient_medicine.valid?
      expect(@patient_medicine.errors.full_messages).to include("Day can't be blank")
    end

    it 'day_idが1の場合、登録できない' do
      @patient_medicine.day_id = 1
      @patient_medicine.valid?
      expect(@patient_medicine.errors.full_messages).to include("Day must be other than 1")
    end

    it 'start_dayが空の場合、登録できない' do
      @patient_medicine.start_day = nil
      @patient_medicine.valid?
      expect(@patient_medicine.errors.full_messages).to include("Start day can't be blank")
    end

    it 'patient_idが空の場合、登録できない' do
      @patient_medicine.patient_id = nil
      @patient_medicine.valid?
      expect(@patient_medicine.errors.full_messages).to include("Patient can't be blank")
    end
  end
end