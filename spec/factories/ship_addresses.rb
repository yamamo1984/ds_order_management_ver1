FactoryBot.define do
  factory :ship_address do
    ship_address_num  {"TEST-111"}
    first_name        {"テスト"}
    last_name         {"太郎"}  
    company           {"テスト会社1"}
    email             {"test@mail.com"}
    tel               {"0123456789"}
    post_code         {"1111111"}
    place_id          {1}
    city              {"テスト町"}
    street_num        {"テスト１−1"}
  end
end
