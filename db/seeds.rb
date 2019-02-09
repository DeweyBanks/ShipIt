require 'database_cleaner'

DatabaseCleaner.clean_with(:truncation)


10.times do
  Vendor.create(name: "#{Faker::Company.name}")
end
