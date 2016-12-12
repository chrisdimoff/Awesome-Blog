# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Category Creation ***************
categories = ["Fitness", "Technology", "Education", "Travel", "Food", "Misc."]

categories.each do |cat|
  Category.create({title: cat})
end
puts Cowsay.say("made #{categories.length} categories!", 'cow')
#***********************************
#
#
# # Tag creation **********************
Tag.create ({ name: "Advertising"})
 Tag.create ({ name: "Advice"})
 Tag.create ({ name: "Android"})
 Tag.create ({ name: "Africa"})
 Tag.create ({ name: "Anime"})
 Tag.create ({ name: "Apple"})
 Tag.create ({ name: "Architecture"})
 Tag.create ({ name: "Art"})
 Tag.create ({ name: "Baking"})
 Tag.create ({ name: "Beauty"})
 Tag.create ({ name: "Blog"})
 Tag.create ({ name: "Book"})
 Tag.create ({ name: "Business"})
 Tag.create ({ name: "Canada"})
 Tag.create ({ name: "Cars"})
 Tag.create ({ name: "Cartoons"})
 Tag.create ({ name: "Celebrities"})
 Tag.create ({ name: "Comedy"})
 Tag.create ({ name: "Comics"})
 Tag.create ({ name: "Cooking"})
 Tag.create ({ name: "Crafts"})
 Tag.create ({ name: "Dating"})
 Tag.create ({ name: "Design"})
 Tag.create ({ name: "Dogs"})
 Tag.create ({ name: "Drawing"})
 Tag.create ({ name: "Economy"})
 Tag.create ({ name: "Education"})
 Tag.create ({ name: "Entertainment"})
 Tag.create ({ name: "Environment"})
 Tag.create ({ name: "Events"})
 Tag.create ({ name: "Excercise"})
 Tag.create ({ name: "Family"})
 Tag.create ({ name: "Fantasy"})
 Tag.create ({ name: "Fashion"})
 Tag.create ({ name: "Film"})
 Tag.create ({ name: "Fitness"})
 Tag.create ({ name: "Folk"})
 Tag.create ({ name: "Food"})
 Tag.create ({ name: "Football"})
 Tag.create ({ name: "Fun"})
 Tag.create ({ name: "Funny"})
 Tag.create ({ name: "Games"})
 Tag.create ({ name: "Graphic Design"})
 Tag.create ({ name: "Health"})
 Tag.create ({ name: "History"})
 Tag.create ({ name: "Internet"})
 Tag.create ({ name: "Love"})
 Tag.create ({ name: "Law"})
 Tag.create ({ name: "Lifestyle"})
 Tag.create ({ name: "Management"})
 Tag.create ({ name: "Marketing"})
 Tag.create ({ name: "Media"})
 Tag.create ({ name: "Mobile"})
 Tag.create ({ name: "Money"})
 Tag.create ({ name: "Movies"})
 Tag.create ({ name: "Music"})
 Tag.create ({ name: "Nature"})
 Tag.create ({ name: "News"})
 Tag.create ({ name: "Nutrition"})
 Tag.create ({ name: "Painting"})
 Tag.create ({ name: "Personal"})
 Tag.create ({ name: "Pets"})
 Tag.create ({ name: "Philosophy"})
 Tag.create ({ name: "Photography"})
 Tag.create ({ name: "Poetry"})
 Tag.create ({ name: "Politics"})
 Tag.create ({ name: "Relationships"})
 Tag.create ({ name: "Recipes"})
 Tag.create ({ name: "Sex"})
 Tag.create ({ name: "Shopping"})
 Tag.create ({ name: "Social Media"})
 Tag.create ({ name: "Software"})
 Tag.create ({ name: "Sports"})
 Tag.create ({ name: "Technology"})
 Tag.create ({ name: "Tips"})
 Tag.create ({ name: "Travel"})
 Tag.create ({ name: "TV"})
 Tag.create ({ name: "Vacation"})
 Tag.create ({ name: "Video"})
 Tag.create ({ name: "Videogames"})
 Tag.create ({ name: "Web"})
 Tag.create ({ name: "Web Design"})
 Tag.create ({ name: "Wildlife"})
 Tag.create ({ name: "Wine"})
 Tag.create ({ name: "Writing"})
puts Cowsay.say("generated #{Tag.all.length} tags" , 'random')
# # *******************************

#user creation *******************************
50.times do
  User.create({
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: "secret",
    password_confirmation: "secret"
    })
end

puts Cowsay.say("generated #{User.all.length} users", 'random')


# **********************************************



#Post Creation ************************
users = User.all
tags = Tag.all
25.times do

  Post.create({
    title: Faker::Company.name,
    body: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
    category_id: Category.order("RANDOM()").limit(1).last.id,
    tags: tags.sample(rand(3) + 1),
    user: users.sample(1)[0]
   }
    )

  end

  puts Cowsay.say("Generated 100 posts", 'random')
# **************************************





#comments creation ***************************
posts = Post.all
users = User.all
for i in 1..200 do
  Comment.create({
    body: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. #{i}",
    post: posts.sample(1)[0],
    user: users.sample(1)[0]
    })
end

puts Cowsay.say("generated #{Comment.all.length} comments", 'cow')
# *************************************************
