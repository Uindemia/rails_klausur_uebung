# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

author = Author.create! username: "admin", email: "admin@local.host"
article = Article.create! title: Faker::Lorem.sentence,
                author: author,
                teaser: Faker::Hacker.say_something_smart,
                content: Faker::Lorem.paragraphs(rand(3..9)).join("\n"),
                publish_at: 2.weeks.ago,
                publish_until: 2.years.from_now

article.categories << Category.find_or_create_by(name: "Cat 1")
article.categories << Category.find_or_create_by(name: "Cat 2")
article.categories << Category.find_or_create_by(name: "Cat 3")
