FactoryGirl.define do
  factory :user do
  	sequence(:name){|n| "Person #{n}"}
  	sequence(:email){|n| "person_#{n}@test.com"}
    password "123123123"
    password_confirmation "123123123"

factory :admin do
      admin true
    end
  end

    factory :micropost do
    content "Lorem ipsum"
    user
  end
  end
