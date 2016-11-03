# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# Dummy User
user_list = [
    "Robert", "Sebastian", "Aijana", "Kirill", "Olga", "Felix", "Martin"
]

user_list.each do |user|
    User.create(first_name: user ,email: user + "@pimsuite.de", password: "Secure!12345678")
end
