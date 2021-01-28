FactoryBot.define do
  factory :patient_medicine do
    medical_record_number {'0123-2'}
    last_name {'田中'}
    first_name {'ニャー'}
    name {'おくすり'}
    usage_id {2}
    dose_id {2}
    day_id {2}
    start_day {'2021-01-27'}
  end
end