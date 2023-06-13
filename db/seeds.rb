# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
admin = Admin.new(email: 'admin@sample.com', password: 'password')
admin.save

category_names = %w(
  ダイビング
  クルーズ
  カテゴリー３
  カテゴリー４
  カテゴリー５
)

category_names.each do |category_name|
  Category.create!(category_name: category_name)
end

if Rails.env.development?  #本番ではここから3つ目のENDまでコメントアウトする#
  category_count = Category.all.count

  (1..5).each do |i|
    user = User.create!(nickname: "user#{i}", email: "user#{i}@sample.com", password: 'password')
    rand(1..3).times do |t|
      user.reviews.create!(category_id: rand(1..category_count), title: "review_title_#{t + 1}", introduction: "test" * 5)
    end
  end
end