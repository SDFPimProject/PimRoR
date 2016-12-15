# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

def createWelcomeMess(conversation, send_from, recieve)
  message = conversation.messages.create(:body => "Hey " + recieve.first_name + " Willkommen bei PimSuite+, <br /> <br /> ich freue mich dich beim Messanger zu begrüßen zu können. <br /> Du hast Angst das jmd. deine Nachrichten lesen kann? Keine sorge die Kommunikation ist über SSL verschlüsselt und die Nachrichten werden ebenfalls in der DB verschküsselt gespeichert! <br /> <br /> Du glaubst mit nicht? Dann Check den Code: <br /> <a href='https://github.com/SDFPimProject/PimRoR' target='_blank'>https://github.com/SDFPimProject/PimRoR</a> <br/> <br/> Dein PimSuite+ Bot")
  message.send_from_id = send_from.id
  message.is_send = true
  message.save!
end

USER_ROLE = {
    admin: "admin",
    moderator: "moderator",
    user: "author",
    banned: "banned"
}

USER_TEAM_ROLE = {
    admin: "manager",
    user: "user"
}
USER_PROJEKT_ROLE = {
    admin: "manager",
    user: "user"
}

student_list =
    [
        {
            "last_name": "Wochinger",
            "first_name": "Tobias",
            "email": "s0552880@htw-berlin.de",
            "projekt": "B",
            "role": USER_PROJEKT_ROLE[:admin]
        },
        {
            "last_name": "Doan",
            "first_name": "Duc Long",
            "email": "s0552870@htw-berlin.de",
            "projekt": "C",
            "role": USER_PROJEKT_ROLE[:admin]
        },
        {
            "last_name": "Pupke",
            "first_name": "Jakob",
            "email": "s0540224@htw-berlin.de",
            "projekt": "D",
            "role": USER_PROJEKT_ROLE[:admin]
        },
        {
            "last_name": "Schwanke",
            "first_name": "Felix",
            "email": "s0535496@htw-berlin.de",
            "projekt": "E",
            "role": USER_PROJEKT_ROLE[:admin]
        },
        {
            "last_name": "Franken",
            "first_name": "Adrian",
            "email": "s0538115@htw-berlin.de",
            "projekt": "F",
            "role": USER_PROJEKT_ROLE[:admin]
        },
        {
            "last_name": "Fröhlich",
            "first_name": "Moritz",
            "email": "s0539692@htw-berlin.de",
            "projekt": "A",
            "role": USER_PROJEKT_ROLE[:admin]
        },
        {
            "last_name": "Akbar",
            "first_name": "Muhammad Juans",
            "email": "0529263@htw-berlin.de",
            "projekt": "A",
            "role": USER_PROJEKT_ROLE[:user]
        },
        {
            "last_name": "Engelmann",
            "first_name": "Karsten",
            "email": "s0533407@htw-berlin.de",
            "projekt": "A",
            "role": USER_PROJEKT_ROLE[:user]
        },
        {
            "last_name": "Feurich",
            "first_name": "Dustin",
            "email": "s0540042@htw-berlin.de",
            "projekt": "A",
            "role": USER_PROJEKT_ROLE[:user]
        },
        {
            "last_name": "Mehlei",
            "first_name": "Nicolas",
            "email": "s0522558@htw-berlin.de",
            "projekt": "A",
            "role": USER_PROJEKT_ROLE[:user]
        },
        {
            "last_name": "Myakinen",
            "first_name": "Anna",
            "email": "s0533305@htw-berlin.de",
            "projekt": "A",
            "role": USER_PROJEKT_ROLE[:user]
        },
        {
            "last_name": "Schulz",
            "first_name": "Daniel",
            "email": "s0539257@htw-berlin.de",
            "projekt": "A",
            "role": USER_PROJEKT_ROLE[:user]
        },
        {
            "last_name": "Baumgard",
            "first_name": "Anna Annida",
            "email": "s0530489@htw-berlin.de",
            "projekt": "B",
            "role": USER_PROJEKT_ROLE[:user]
        },
        {
            "last_name": "Bergfeld",
            "first_name": "Max",
            "email": "s0539344@htw-berlin.de",
            "projekt": "B",
            "role": USER_PROJEKT_ROLE[:user]
        },
        {
            "last_name": "Grundmann",
            "first_name": "Oliver",
            "email": "s0552871@htw-berlin.de",
            "projekt": "B",
            "role": USER_PROJEKT_ROLE[:user]
        },
        {
            "last_name": "Horn",
            "first_name": "Hannes",
            "email": "s0540546@htw-berlin.de",
            "projekt": "B",
            "role": USER_PROJEKT_ROLE[:user]
        },
        {
            "last_name": "Weibert",
            "first_name": "Andreas",
            "email": "s0552878@htw-berlin.de",
            "projekt": "B",
            "role": USER_PROJEKT_ROLE[:user]
        },
        {
            "last_name": "Wolfmaier",
            "first_name": "Andreas",
            "email": "s0534830@htw-berlin.de",
            "projekt": "B",
            "role": USER_PROJEKT_ROLE[:user]
        },
        {
            "last_name": "Ahlhelm",
            "first_name": "Ruben",
            "email": "s0540077@htw-berlin.de",
            "projekt": "C",
            "role": USER_PROJEKT_ROLE[:user]
        },
        {
            "last_name": "Berthold",
            "first_name": "Jan-Erik",
            "email": "s0539712@htw-berlin.de",
            "projekt": "C",
            "role": USER_PROJEKT_ROLE[:user]
        },
        {
            "last_name": "Kinder",
            "first_name": "Eugen",
            "email": "s0539723@htw-berlin.de",
            "projekt": "C",
            "role": USER_PROJEKT_ROLE[:user]
        },
        {
            "last_name": "Osmolovskyy",
            "first_name": "Oleksiy",
            "email": "s0524752@htw-berlin.de",
            "projekt": "C",
            "role": USER_PROJEKT_ROLE[:user]
        },
        {
            "last_name": "Schulze",
            "first_name": "Maximiliaan",
            "email": "s0540072@htw-berlin.de",
            "projekt": "C",
            "role": USER_PROJEKT_ROLE[:user]
        },
        {
            "last_name": "Steinepress",
            "first_name": "Eugen",
            "email": "s0527396@htw-berlin.de",
            "projekt": "C",
            "role": USER_PROJEKT_ROLE[:user]
        },
        {
            "last_name": "Demuth",
            "first_name": "Jonas Alexander",
            "email": "s0539424@htw-berlin.de",
            "projekt": "D",
            "role": USER_PROJEKT_ROLE[:user]
        },
        {
            "last_name": "Fink",
            "first_name": "Julian",
            "email": "s0538645@htw-berlin.de",
            "projekt": "D",
            "role": USER_PROJEKT_ROLE[:user]
        },
        {
            "last_name": "Goy",
            "first_name": "Kevin",
            "email": "s0538977@htw-berlin.de",
            "projekt": "D",
            "role": USER_PROJEKT_ROLE[:user]
        },
        {
            "last_name": "Horbert",
            "first_name": "Penelope",
            "email": "s0552872@htw-berlin.de",
            "projekt": "D",
            "role": USER_PROJEKT_ROLE[:user]
        },
        {
            "last_name": "Konrad",
            "first_name": "Rolf",
            "email": "s0539503@htw-berlin.de",
            "projekt": "D",
            "role": USER_PROJEKT_ROLE[:user]
        },
        {
            "last_name": "Petke",
            "first_name": "Maria",
            "email": "s0552876@htw-berlin.de",
            "projekt": "D",
            "role": USER_PROJEKT_ROLE[:user]
        },
        {
            "last_name": "Remus",
            "first_name": "Richard",
            "email": "s0542820@htw-berlin.de",
            "projekt": "D",
            "role": USER_PROJEKT_ROLE[:user]
        },
        {
            "last_name": "Kasseck",
            "first_name": "Robert",
            "email": "s0543583@htw-berlin.de",
            "projekt": "E",
            "role": USER_PROJEKT_ROLE[:user]
        },
        {
            "last_name": "Kindt",
            "first_name": "Sebastian",
            "email": "s0555665@htw-berlin.de",
            "projekt": "E",
            "role": USER_PROJEKT_ROLE[:user]
        },
        {
            "last_name": "Rau",
            "first_name": "Kirill",
            "email": "s0539746@htw-berlin.de",
            "projekt": "E",
            "role": USER_PROJEKT_ROLE[:user]
        },
        {
            "last_name": "Schumann",
            "first_name": "Aijana",
            "email": "s0534947@htw-berlin.de",
            "projekt": "E",
            "role": USER_PROJEKT_ROLE[:user]
        },
        {
            "last_name": "Sylenko",
            "first_name": "Olga",
            "email": "s0539758@htw-berlin.de",
            "projekt": "E",
            "role": USER_PROJEKT_ROLE[:user]
        },
        {
            "last_name": "Weber",
            "first_name": "Martin",
            "email": "s0556072@htw-berlin.de",
            "projekt": "E",
            "role": USER_PROJEKT_ROLE[:user]
        },
        {
            "last_name": "Hampf",
            "first_name": "Christopher",
            "email": "s0539500@htw-berlin.de",
            "projekt": "F",
            "role": USER_PROJEKT_ROLE[:user]
        },
        {
            "last_name": "Jaszkowic",
            "first_name": "Jonas",
            "email": "s0556248@htw-berlin.de",
            "projekt": "F",
            "role": USER_PROJEKT_ROLE[:user]
        },
        {
            "last_name": "Nowca",
            "first_name": "Jonathan",
            "email": "s0539742@htw-berlin.de",
            "projekt": "F",
            "role": USER_PROJEKT_ROLE[:user]
        },
        {
            "last_name": "Radigk",
            "first_name": "Benjamin",
            "email": "s0535275@htw-berlin.de",
            "projekt": "F",
            "role": USER_PROJEKT_ROLE[:user]
        },
        {
            "last_name": "Sagoyan",
            "first_name": "Dmitry",
            "email": "s0548717@htw-berlin.de",
            "projekt": "F",
            "role": USER_PROJEKT_ROLE[:user]
        },
        {
            "last_name": "Seidel",
            "first_name": "Florian",
            "email": "s0539504@htw-berlin.de",
            "projekt": "F",
            "role": USER_PROJEKT_ROLE[:user]
        }
    ]

prof_list = [
    {
        first_name: "Albrecht",
        last_name: "Fortenbacher",
        email: "albrecht.fortenbacher@htw-berlin.de"
    }
]

user_list = [
    "Robert", "Sebastian", "Aijana", "Kirill", "Olga", "Felix", "Martin"
]

# TEAMS
tSDF = Team.create(name: "System Development and Frameworks")
tAdmins = Team.create(name: "Admins")
tEntwickler = Team.create(name: "Entwickler")
tVertrieb = Team.create(name: "Vertrieb")
tEinkauf = Team.create(name: "Einkauf")
tPersonal = Team.create(name: "Personal")
tBerater = Team.create(name: "Berater")
tHotline = Team.create(name: "Hotline")

# PROJECTS
pGreatAgain  = Project.create(name: "Make PimSuite+ greate again!")
pGit  = Project.create(name: "Git")
pMessanger  = Project.create(name: "Messanger")
pKalender  = Project.create(name: "Kalender")
pUserRoles  = Project.create(name: "UserRoles")
pA = Project.create(name: "APS.NET (C#)")
pB = Project.create(name: "Django (Python)")
pC = Project.create(name: "Play (Scala)")
pD = Project.create(name: "Spring (Java)")
pE = Project.create(name: "Ruby on Rails")
pF = Project.create(name: "NodeJS (JavaScript)")

bot = User.create(first_name: "Bot",
                  last_name:"PimSuite+",
                  email:  "bot@pimsuite.de",
                  email_confirmation: "bot@pimsuite.de",
                  password: "jsfer4herb132sb#ijo#qr'uwerz289490!65236Q7O34VHBSFd,bsl",
                  role: USER_ROLE[:admin],
                  street_and_nr:"PimSuite 1",
                  birthday: "01.01.1900",
                  state: "Berlin",
                  country_name: "Deutschland",
                  locality: "Berlin",
                  zip_code: "12345")

user_list.each do |user|
  u = User.create(first_name: user,
                    last_name:"PimCrew",
                    email: user + "@pimsuite.de",
                    email_confirmation: user + "@pimsuite.de",
                    password: "Secure!12345678",
                    role: USER_ROLE[:admin],
                    street_and_nr:"Sonnenweg 10",
                    birthday: "01.01.1985",
                    state: "Berlin",
                    country_name: "Deutschland",
                    locality: "Berlin",
                    zip_code: "12351")
  conversation = Conversation.create(sender: bot, recipient: u)
  createWelcomeMess(conversation, bot, u)
  UsersTeam.create(user: u, team: tAdmins, user_team_role: USER_TEAM_ROLE[:user])
  UsersTeam.create(user: u, team: tEntwickler, user_team_role: USER_TEAM_ROLE[:user])
  UsersProject.create(user: u, project: pGreatAgain, user_project_role: USER_PROJEKT_ROLE[:user])

  case u.first_name
    when "Robert"
      UsersProject.create(user: u, project: pUserRoles, user_project_role: USER_PROJEKT_ROLE[:admin])
    when "Sebastian"
        UsersProject.create(user: u, project: pGit, user_project_role: USER_PROJEKT_ROLE[:admin])
    when "Aijana"
        UsersProject.create(user: u, project: pUserRoles, user_project_role: USER_PROJEKT_ROLE[:user])
    when "Kirill"
        UsersProject.create(user: u, project: pKalender, user_project_role: USER_PROJEKT_ROLE[:admin])
    when "Olga"
        UsersProject.create(user: u, project: pKalender, user_project_role: USER_PROJEKT_ROLE[:user])
    when "Martin"
        UsersProject.create(user: u, project: pMessanger, user_project_role: USER_PROJEKT_ROLE[:admin])
  end
end

student_list.each do |student|
  u = User.create(first_name: student[:first_name] ,
                last_name: student[:last_name],
                email: student[:email],
                email_confirmation:  student[:email],
                password: "12345678",
                role: USER_ROLE[:user],
                street_and_nr:"Gutsstraße 2",
                birthday: "01.01.1980",
                state: "Brandenburg",
                country_name: "Deutschland",
                locality: "Potsdam",
                zip_code: "14469")

  conversation = Conversation.create(sender: bot, recipient: u)
  createWelcomeMess(conversation, bot, u)
  UsersTeam.create(user: u, team: tSDF, user_team_role: USER_TEAM_ROLE[:user])

  case student[:projekt]
    when "A"
      UsersProject.create(user: u, project: pA, user_project_role: student[:role])
    when "B"
        UsersProject.create(user: u, project: pB, user_project_role: student[:role])
    when "C"
        UsersProject.create(user: u, project: pC, user_project_role: student[:role])
    when "D"
        UsersProject.create(user: u, project: pD, user_project_role: student[:role])
    when "E"
        UsersProject.create(user: u, project: pE, user_project_role: student[:role])
    when "F"
        UsersProject.create(user: u, project: pF, user_project_role: student[:role])
  end

end

prof_list.each do |prof|
  u = User.create(first_name: prof[:first_name] ,
                last_name: prof[:last_name],
                email: prof[:email],
                email_confirmation: prof[:email],
                password: "12345678",
                role: USER_ROLE[:moderator],
                street_and_nr:"Gutsstraße 2",
                birthday: "01.01.1980",
                state: "Brandenburg",
                country_name: "Deutschland",
                locality: "Potsdam",
                zip_code: "14469")

  conversation = Conversation.create(sender: bot, recipient: u)
  createWelcomeMess(conversation, bot, u)
  UsersTeam.create(user: u, team: tSDF, user_team_role: USER_TEAM_ROLE[:admin])
end





