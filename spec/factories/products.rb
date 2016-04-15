FactoryGirl.define do
  factory :product do

    sequence(:title)  {|n| "#{Faker::Company.bs}-#{n}" }
    description       { Faker::ChuckNorris.fact    }
    price             { 11 + rand(100000)           }
    sale_price        {1+ rand(price)                 }
    category_id       { 11 +rand(50)                       }

  end
end
