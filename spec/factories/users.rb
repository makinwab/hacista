FactoryGirl.define do
  factory :user do
    name "Makinwa Bukola"
    email "makinwa37@gmail.com"
    password "makinwa37"
    username "makinwa37"

    factory :invalid_user do
      name ""
      email "makinwa37"
      password "ma"
      username "ma"
    end

    factory :valid_auth do
      email "makinwa37@gmail.com"
      password "makinwa37"
    end

    factory :invalid_auth do
      email "makinwa@y.o"
      password "maki"
    end
  end
end
