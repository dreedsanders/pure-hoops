User.destroy_all
Player.destroy_all
Post.destroy_all
Team.destroy_all
Game_Card.destroy_all
Follow.destroy_all
Reply.destroy_all

User.create(name: "Bench", email: "bench@bench.com", password: "bench", bank: 0)
5.times do
    name = Faker::Name.unique.name
    password = "123"
    email = Faker::Internet.email
    photo = Faker::Avatar.image
    bio = Faker::Lorem.paragraph(sentence_count: 3)
    
    User.create( name: name, email: email, password: password, bank:0, photo: photo)
end

users=User.all
5.times do
    Follow.create(user_id: users[rand(1-5)].id, following_id: 94)
end
5.times do
    Follow.create(user_id: 94, following_id: users[rand(1-5)].id)
end

Team.create(team_name: "Bench", user_id: 1, attribute_level: 0)

50.times do
    Team.create(team_name: Faker::Team.name, user_id: users[rand(1-5)].id, attribute_level: 0)
end
teams=Team.all

# need a loop that for every team id add 5 players then add constraint to only allow 7 players per team

50.times do
    positions = ["PG","SG","C","SF","PF"]
    name = Faker::Name.unique.name
    position = positions.sample()
    jersey = rand(1...45)
    height ="#{rand(5...7)} ft. #{rand(1...12)} in."
    weight ="#{rand(130...235)} lbs"
    value = rand(1...10)
    cost = rand(1...10)
    Player.create(name: name, position: position, jersey: jersey, height: height, weight: weight, team_id: 1, value: value, cost: cost)
end


50.times do
    thoughts = ["dat boy nice", "stat padder", "nasty work", "point god", "in his bag frfr", "mannn did not hit my parlay cause of this dude"]
    category = "Basketball"
    basketball_subcategories = ["get a life", "game time", "shoes/jerseys/kits", "trivia"]
    Post.create(body: thoughts.sample(), user_id: users[rand(1-5)].id, category: category, subcategory: basketball_subcategories.sample())
end

50.times do
    thoughts = ["yall seen this video", "yall goin to this event?", "doja cat and cardi mmm", "cam or jim jones?"]
    category = "General"
    general_subcategories = ["music", "video games", "events", "other"]
    Post.create(body: thoughts.sample(), user_id: users[rand(1-5)].id, category: category, subcategory: general_subcategories.sample())
end

50.times do
    thoughts = ["help", "this guy sucks", "wheres my stuff", "please hlep"]
    category = "Admin"
    admin_subcategories = ["questions", "help"]
    Post.create(body: thoughts.sample(), user_id: users[rand(1-5)].id, category: category, subcategory: admin_subcategories.sample())
end

posts = Post.all

50.times do
    Reply.create(post_id: posts[rand(1-150)].id, user_id: users[rand(1-5)].id, body: Faker::Quote.famous_last_words)
end

# Player.create(name: "Jon Gilbert", position: "C", jersey: "43", height: "5ft10in", weight: "155", team_id: 1)


# ActionCard.create(title: "PRACTICE?!", description: "you talkin about practice?", action: "defense" )

# GameCard.create(location: location, default_rating: rating, team_id: team_id)