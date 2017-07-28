FactoryGirl.define do
  factory :content do
    kind { ["h1", "h2", "h3", "a"].sample }
    value { if kind == "a" then Faker::Internet.url else Faker::Lorem.sentence end }
    page_id nil
  end
end
