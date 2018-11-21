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
#Jobs
# Job chưa hết hạn
10.times do |n|
  Job.create!(
    organization_id: 1,
    career_id: n+1,
    province_id: n+1,
    title: FFaker::Lorem.sentence(3),
    age_from: 20,
    age_to: 40,
    salary: 10000000,
    work_address: FFaker::Lorem.sentence(rand(3)),
    employment_type: "Full time",
    skill: FFaker::Lorem.sentence(rand(10..30)),
    level: FFaker::Lorem.sentence(rand(5..10)),
    experience: "2 năm",
    description: FFaker::Lorem.sentence(20),
    expiration_date: "2018-11-28",
    created_at: "2018-10-01 16:52:08",
    updated_at: "2018-11-12 16:52:08"
  )
end
#Job mới đăng
10.times do |n|
  Job.create!(
    organization_id: 1,
    career_id: n+1,
    province_id: n+1,
    title: FFaker::Lorem.sentence(3),
    age_from: 25,
    age_to: 35,
    salary: 20000000,
    work_address: FFaker::Lorem.sentence(rand(3)),
    employment_type: "Part time",
    skill: FFaker::Lorem.sentence(rand(10..30)),
    level: FFaker::Lorem.sentence(rand(5..10)),
    experience: "1 năm",
    description: FFaker::Lorem.sentence(20),
    expiration_date: "2018-11-28",
    created_at: DateTime.current,
    updated_at: DateTime.current
  )
end
