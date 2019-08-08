# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# coding: utf-8

<<<<<<< HEAD
Admin.find_or_create_by(id: 1) do |admin|
  admin.email = 'admin@example.com'
  admin.password = '123456'
end
=======
Setting.find_or_create_by(id: 1) do |setting|
    setting.shipping = 500
    setting.tax = 0.08
    setting.shop_address = "長野県安曇野市xx-xx-xx"
    setting.shop_tel = "050-xxxx-xxxx"
  end
>>>>>>> master
