FactoryGirl.define do

  factory :message do
    body  {Faker::Beer}
    image { fixture_file_upload("#{::Rails.root}/spec/fixtures/image/1.png", "image/png")}
    group_id        5
    user_id         4
  end

end
