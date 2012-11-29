FactoryGirl.define do
  factory :user do
    email  "test@test.com"
    password 'password'.encode('utf-8')
  end
end