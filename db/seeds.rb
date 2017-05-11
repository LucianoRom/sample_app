User.create!(name:  "Romuald Six",
             email: "romuald.six@gmail.com",
             password:              "Tesstify777",
             password_confirmation: "Tesstify777",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)

Api.create!(api_name: "microposts",
            address: "home",
            apicture: "")
