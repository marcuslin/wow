FactoryGirl.define do
  factory :admin, :class => User do
    email 'admin@wordsentry.com'
    user_name 'admin'
    password '12345678'
    password_confirmation '12345678'
    admin true
  end

  factory :user do
    email 'user@wordsentry.com'
    user_name 'user'
    password '12345678'
    password_confirmation '12345678'
    admin false
  end

  factory :char1, :class => Character do
    name 'char1'
  end

  factory :char2, :class => Character do
    name 'char2'
  end

  factory :equip1, :class => Equipment do
    equip_name 'equip1'
  end
end