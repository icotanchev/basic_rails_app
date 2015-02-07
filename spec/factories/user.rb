FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user_#{n}@emerchantpay.com" }
    sequence(:first_name) { |n| "First_Name_Of_User_#{n}" }
    sequence(:last_name) { |n| "Last_Name_Of_User_#{n}" }
    password 'test123456'
    password_confirmation { password }

    trait :john_doe do
      email 'john.doe@emp.com'
      first_name 'John'
      last_name 'Doe'
      password 'john:doe75'
      password_confirmation { password }
    end
    
    trait :admin do
      email 'admin@test.com'
      first_name 'Admin'
      last_name 'Admin'
      role 'admin'
      password 'test123456'
      password_confirmation { password }
    end

    trait :user do
      email 'admin@test.com'
      first_name 'User'
      last_name 'User'
      role 'user'
      password 'test123456'
      password_confirmation { password }
    end
  end
end
