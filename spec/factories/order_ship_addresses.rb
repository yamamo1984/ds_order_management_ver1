FactoryBot.define do
  factory :order_ship_address do
    order_num            {"TEST-111"}
    item_id              {1}
    customer_id          {1}
    purchase_num         {1}  
    price                {1} 
    ship_address_num     {"SEND-111"}  
    first_name           {"テスト"}
    last_name            {"太郎"}
    company              {"テスト会社1"}
    email                {"test@mail.com"}
    post_code            {"1111111"}
    place_id             {1}
    tel                  {"0123456789"}
    city                 {"テスト町"}
    street_num           {"テスト１−1"}
  end
end
