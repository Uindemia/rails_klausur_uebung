# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

author = Author.create! username: "admin", email: "admin@local.host"
Article.create! title: Lorem::Base.new(:words, 5).output,
                author: author,
                teaser: Lorem::Base.new(:words, 20).output,
                content: Lorem::Base.new(:paragraphs, 5).output