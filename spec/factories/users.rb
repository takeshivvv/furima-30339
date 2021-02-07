FactoryBot.define do
  factory :user do
    nickname {Faker::Name.name}
    email {Faker::Internet.free_email}
    password {"111ooo"}
    password_confirmation {password}
    last_name {"山田"}
    first_name {"太朗"}
    last_name_kana {"ヤマダ"}
    first_name_kana {"タロウ"}
    birth_date {"1990-09-09"}
  end
end

#Faker::Lorem.characters(min_alpha: 1, min_numric: 1)