# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

3.times do |n|
  user = User.find_or_create_by!(email: "user00#{n + 1}@test.com") do |user_pass|
    user_pass.password = "test1234"
  end
    50.times do |m|
      user.articles.find_or_create_by!(title: "No.#{m + 1}: user00#{n + 1}の記事") do |user_cont|
        user_cont.content = "No.#{m + 1}: user00#{n + 1}の記事の本文"
        user_cont.tag_ids = Tag.all.pluck(:id)
      end
    end
end
