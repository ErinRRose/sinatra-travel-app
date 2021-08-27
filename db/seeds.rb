erin = User.create(name: "Erin", username: "Erin", password: "password")
quinn = User.create(name: "Quinn", username: "Quinn", password: "password")


TravelEntry.create(content: "London, England", user_id: erin.id)
erin.travel_entries.create(content: "Glasglow, Scotland")