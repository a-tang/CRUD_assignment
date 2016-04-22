FactoryGirl.define do
  factory :review do

    association :user, factory: :user
    association :product, factory: :campaign
    # product nil
    body        { Faker::ChuckNorris.fact }
    stars       { rand(5)}
    end
end
