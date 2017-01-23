FactoryGirl.define do
  factory :movie do |f|
    # f.association :user, factory: 'user'
    f.title 'Test Movie 1'
    f.status 'Not Seen'
    f.oscar_year '2017'
  end
end
