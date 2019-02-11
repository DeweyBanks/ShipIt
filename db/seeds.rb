require 'database_cleaner'

DatabaseCleaner.clean_with(:truncation)

status_choices = ["normal", "not normal", "very late"]

10.times do
  Vendor.create(name: "#{Faker::Company.name}")
end

Vendor.all.each do |vendor|
  10.times do |n|
    Shipment.create!(
      tracking_number: "#{n}_#{Faker::Invoice.creditor_reference}",
      shipped_at: Time.now,
      expected_delivery_date: Time.current + rand(1..20).days,
      delivered_at: Time.current + rand(1..100).days,
      status: status_choices.sample,
      order_attributes: {
                          number: "#{n}_#{Faker::Invoice.creditor_reference}",
                          vendor_id: vendor.id,
                          status: "active"
                        },
      address_attributes: {
        address1: "#{Faker::Address.street_address}",
        address2: "#{Faker::Address.secondary_address}",
        city: "#{Faker::Address.city}",
        zipcode: "#{Faker::Address.zip_code}",
        state_name: "#{Faker::Address.state_abbr}"
      }
    )
  end
end

