# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# # Category Creation ***************
# categories = ["Fitness", "Technology", "Education", "Travel", "Food", "Misc."]
#
# categories.each do |cat|
#   Category.create({title: cat})
# end
# puts Cowsay.say("made #{categories.length} categories!", 'cow')
# #***********************************
#
#
# # Tag creation **********************
# 15.times do
#   Tag.create({name: Faker::Space.constellation})
# end
# puts Cowsay.say('Generated up to 15 tags', 'random')
# # *******************************

#Post Creation ************************
tags = Tag.all
100.times do

  Post.create({
    title: Faker::Company.name,
    body: Faker::Company.catch_phrase,
    category_id: Category.order("RANDOM()").limit(1).last.id,
    tags: tags.sample(rand(3) + 1)
   }
    )

  end

  puts Cowsay.say("Generated 100 posts", 'random')
# **************************************
