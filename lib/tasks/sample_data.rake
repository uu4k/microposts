namespace :db do
    desc "Fill database with sample data"
    task populate: :environment do
        100.times do |n|
            name = Faker::Name.name
            email = "example-#{n+1}@example.jp"
            password = "password"
            user = User.create!(name: name,email: email,password: password,password_confirmation: password,location: "location", profile: "profile")
            
            99.times do 
                user.microposts.create!(content: Faker::Lorem.sentence(5))
            end
        end
        User.all.each do |user|
            User.all.each do |user2|
                next if user == user2
                next if Random.rand(1 .. 1000) % 3 != 0
                user.follow(user2)
            end
        end
    end
end