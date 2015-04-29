FactoryGirl.define do
  factory :user do
    nickname 'spectest'
    mail 'spectest@test.com'
    device '0'
    password '1016'
  end
end
