FactoryBot.define do
  factory :user do
    nickname {'test'}
    email {'test@test'}
    password {'test1test1'}
    password_confirmation {password}
  end
end
