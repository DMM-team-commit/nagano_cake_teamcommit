# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
   email: 'test1@test.com',
   password: 'testtest'
)

Genre.create!(name: 'ケーキ')

Genre.create!(name: 'プリン')

Genre.create!(name: '焼き菓子')

3.times do |n|
   Item.create!(
      genre_id: n + 1,
      name: "商品テスト#{n + 1}",
      description: "美味しいです。",
      price: 1000 + (n * 100),
      is_active: true
   )

end