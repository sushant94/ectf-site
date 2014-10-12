# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = User.all
users.each do |user|
    t = Team.create(teamName: user.teamName)
    user.team_id = t.id
    user.confirmed = true
    WelcomeMailer.delay.notify(user.id)
    user.save
end
