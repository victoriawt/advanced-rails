FactoryGirl.define do
  factory :movie do
    title 'A Fake Title'
    rating 'G'
    release_date { 10.years.ago }
  end
end
