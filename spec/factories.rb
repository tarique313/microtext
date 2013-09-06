FactoryGirl.define do
  factory :user do
    name     "Gazi Tarique"
    email    "gazi@gmail.com"
    password "foobar123"
    password_confirmation "foobar123"
  end
end