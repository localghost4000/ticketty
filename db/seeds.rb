unless User.exists?(email: "admin@ticketty.com")
  User.create!(email: "admin@ticketty.com", password: "password", admin: true)
end

unless User.exists?(email: "user@ticketty.com")
  User.create!(email: "user@ticketty.com", password: "password")
end

["Ruby on Rails", "Node.js"].each do |name|
  unless Project.exists?(name: name)
    Project.create!(name: name, description: "A sample project about #{name}")
  end
end
