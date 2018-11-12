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
#Career
50.times do |n|
  Career.create!(name: FFaker::Name.name,
      description: FFaker::Lorem.sentence(rand(20..30))
    )
end
#Province
50.times do |n|
  Province.create!(name: FFaker::Name.name)
end
#OrganizationUsers
5.times do |n|
  OrganizationUser.create!(user_id: n+1,
      organization_id: n+1,
      admin: true
    )
end
3.times do |n|
  OrganizationUser.create!(user_id: 1,
      organization_id: n+2,
      admin: false
    )
end
