FactoryBot.define do
  factory :user do
    email                 {Faker::Internet.free_email}
    password              {'000yyy'}
    password_confirmation {password}
    first_name            {'テスト'}
    last_name             {'テスト'}
  end
end

