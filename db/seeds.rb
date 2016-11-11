# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.create(first_name: "Robert", last_name: "Doe", email: "robert@pimsuite.de",  email_confirmation: "robert@pimsuite.de",  password: "12345678", role: "admin")
User.create(first_name: "Sebastian", last_name: "Doe", email: "rebastian@pimsuite.de",  email_confirmation: "sebastian@pimsuite.de",  password: "12345678", role: "admin")
User.create(first_name: "Aijana", last_name: "Doe", email: "aijana@pimsuite.de",  email_confirmation: "aijana@pimsuite.de",  password: "12345678", role: "admin")
User.create(first_name: "Kirill", last_name: "Doe", email: "kirill@pimsuite.de",  email_confirmation: "kirill@pimsuite.de",  password: "12345678", role: "admin")
User.create(first_name: "Olga", last_name: "Doe", email: "olga@pimsuite.de",  email_confirmation: "olga@pimsuite.de",  password: "12345678", role: "admin")
User.create(first_name: "Martin", last_name: "Doe", email: "martin@pimsuite.de",  email_confirmation: "martin@pimsuite.de",  password: "12345678", role: "admin")
User.create(first_name: "admin", last_name: "admin", email: "admin@pimsuite.de",  email_confirmation: "admin@pimsuite.de",  password: "12345678", role: "admin")

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

student_list.each do |student|
    User.create(first_name: student, last_name: "Doe", email: student + "@htw-berlin.de", email_confirmation: student + "@htw-berlin.de", password: "12345678", role: "author")
end

