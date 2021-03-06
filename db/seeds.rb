# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'
include RandomData

 
 admin = User.create!(
   name:     'Admin User',
   email:    'admin@e50xample.com',
   password: 'helloworld',
   role:     'admin'
 )

 member = User.create!(
   name:     'Member User',
   email:    'member@example.com',
   password: 'helloworld'
 )
  users = User.all
 

15.times do
    Topic.create!(
        name: RandomData.random_sentence,
        description: RandomData.random_paragraph
        )
    end
    
    
 topics =Topic.all


50.times do 
    post = Post.create!(
        user: users.sample,
        title: Faker::Lorem.sentence,
        body: Faker::Lorem.paragraph,
        topic: topics.sample
        
        )
post.update_attribute(:created_at, rand(10.minutes .. 1.year).ago)
rand(1..5).times { post.votes.create!(value: [-1, 1].sample, user: users.sample) }


end


posts = Post.all

100.times do
    Comment.create!(
    user: users.sample,
    post: posts.sample,
    body: Faker::Lorem.paragraph
    )
    
end
random = Random.new

50.times do
    Advertisement.create!(
        title: Faker::Lorem.sentence,
        copy: Faker::Lorem.paragraph,
        price: random.rand(500)
        )
end




Post.where(title: "THIS IS THE UNIQUE SEED", body: "THIS IS THE UNIQUE SEED").first_or_create


puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
puts "#{Topic.count} topics created"
puts "#{User.count} users were created"
puts "#{Vote.count} votes created"