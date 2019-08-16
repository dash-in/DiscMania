# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# coding: utf-8

Admin.find_or_create_by(id: 1) do |admin|
  admin.email = 'admin@example.com'
  admin.password = '123456'
end
Setting.find_or_create_by(id: 1) do |setting|
    setting.shipping = 500
    setting.tax = 1.08
    setting.shop_address = "長野県安曇野市xx-xx-xx"
    setting.shop_tel = "050-xxxx-xxxx"
end

Artist.find_or_create_by(id: 1) do |artist|
  artist.name = "Mr.Children"
  artist.description = "テキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキスト"
end

Artist.find_or_create_by(id: 2) do |artist|
  artist.name = "サザンオールスターズ"
  artist.description = "テキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキスト"
end

Artist.find_or_create_by(id: 3) do |artist|
  artist.name = "米津玄師"
  artist.description = "テキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキスト"
end

Artist.find_or_create_by(id: 4) do |artist|
  artist.name = "Mr.Big"
  artist.description = "テキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキスト"
end

Artist.find_or_create_by(id: 5) do |artist|
  artist.name = "Guns'n Roses"
  artist.description = "テキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキスト"
end

Artist.find_or_create_by(id: 6) do |artist|
  artist.name = "Bruno Mars"
  artist.description = "テキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキスト"
end

Artist.find_or_create_by(id: 7) do |artist|
  artist.name = "Bon Jovi"
  artist.description = "テキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキスト"
end

Artist.find_or_create_by(id: 8) do |artist|
  artist.name = "Bump of Chicken"
  artist.description = "テキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキスト"
end

Artist.find_or_create_by(id: 9) do |artist|
  artist.name = "Man with a Mission"
  artist.description = "テキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキスト"
end

ShippingInfo.find_or_create_by(id: 1) do |shipping_info|
  shipping_info.user_id = 1
  shipping_info.name = "ユーザー１太郎"
  shipping_info.post_number = "xxx-xxxx"
  shipping_info.address = "東京都渋谷区渋谷xx-xx-xx"
end