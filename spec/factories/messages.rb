FactoryGirl.define do

  factory :message do
    body  {Faker::Beer}
    image {Faker::Avatar}
    group_id        "5"
    user_id         "4"
  end

end
