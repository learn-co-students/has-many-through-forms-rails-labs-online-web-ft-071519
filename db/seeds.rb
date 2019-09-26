# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

post = Post.create(title: "This is a super post")

user = User.create(username: "lrad008")


comment = Comment.new(content: "what a great post")
comment.user = user
comment.post = post

category = Category.create(name: "fiction")
category = Category.create(name: "non-fiction")