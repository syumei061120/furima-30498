FactoryBot.define do
  factory :user do
    nickname {'test'}
    email {'test@test'}
    password {'123abc'}
    password_confirmation {password}
    family_name {'山田'}
    first_name {'太郎'} 
    family_name_kana {'ヤマダ'}
    first_name_kana {'タロウ'}
    birthday {'1999-12-31'}
  end
end