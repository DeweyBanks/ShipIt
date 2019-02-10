FactoryBot.define do
  factory :shipment do
    tracking_number { "MyString" }
    order { nil }
    expected_delivery_date { "2019-02-10 10:32:41" }
    status { "MyString" }
  end
end
