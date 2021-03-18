FactoryBot.define do
  factory :picture do
    text        {Faker::Lorem.sentence}
    account     {Faker::Lorem.sentence}
    after(:build) do |picture|
      picture.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
    association :user 
  end
end
