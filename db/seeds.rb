#Users
20.times do |n|
  User.create!(name: FFaker::Name.name,
      email: "user-#{n+1}@jobfair.org",
      password: "123456",
      password_confirmation: "123456",
      birthday: "02/02/1996",
      gender: 1,
      phone: "0123456789",
      address: "Hà Nội"
    )
  end
#Organizations
10.times do |n|
  Organization.create!(name: FFaker::Name.name,
      email: "org-#{n+1}@jobfair.org",
      website: "jobfair.com",
      phone: "0123456789",
      address: "Hà Nội",
      scales: "50 người",
      description: FFaker::Lorem.sentence(rand(20..30)),
      founded: 2012
    )
  end
