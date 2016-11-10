# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


team_list = [
    "Robert", "Sebastian", "Aijana", "Kirill", "Olga", "Felix", "Martin"
]

project_list = [
    "Robert", "Sebastian", "Aijana", "Kirill", "Olga", "Felix", "Martin"
]

team_list.each do |team|
    Team.create(name: team)
end

project_list.each do |project|
    Project.create(name: project)
end


user_list = [
    "Robert", "Sebastian", "Aijana", "Kirill", "Olga", "Felix", "Martin"
]

student_list = [
    "Albrecht.Fortenbacher",
    "s0552880",
    "s0552870",
    "s0540224",
    "s0535496",
    "s0538115",
    "s0539692",
    "s0529263",
    "s0533407",
    "s0540042",
    "s0522558",
    "s0533305",
    "s0539257",
    "s0530489",
    "s0539344",
    "s0552871",
    "s0540546",
    "s0552878",
    "s0534830",
    "s0540077",
    "s0539712",
    "s0539723",
    "s0524752",
    "s0540072",
    "s0527396",
    "s0539424",
    "s0538645",
    "s0538977",
    "s0552872",
    "s0539503",
    "s0552876",
    "s0542820",
    "s0543583",
    "s0555665",
    "s0539746",
    "s0534947",
    "s0539758",
    "s0556072",
    "s0539500",
    "s0556248",
    "s0539742",
    "s0535275",
    "s0548717",
    "s0539504"
]

user_list.each do |user|
    u = User.create(first_name: user, last_name:"Doe", email: user + "@pimsuite.de", email_confirmation: user + "@pimsuite.de", password: "Secure!12345678", role: "admin", street_and_nr:"Sonnenweg 10")
    u.projects << Project.find_by_name(u.first_name)
    u.teams << Team.find_by_name(u.first_name)
    u.save!
end

student_list.each do |student|
    User.create(first_name: student ,email: student + "@htw-berlin.de", password: "123456", role: "author")
end


