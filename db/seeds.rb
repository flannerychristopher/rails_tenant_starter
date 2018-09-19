# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

(1..5).to_a.each do |i|
  name = "Tenant ##{i}"
  puts name
  tenant = Tenant.where(name: name).first_or_initialize
  tenant.save
  puts "Created #{tenant.name}"

  (1..5).to_a.each do |j|
    puts j
    name = "Event #{i}-#{j}"
    event = Tenant::Event.where(
      name: name,
      tenant_id: i
    ).first_or_initialize
    event.save
    puts "Created Tenant::Event #{event.name}"
    j += 1
  end
  i += 1

end

Role.first_or_create(name: :super_admin)
Role.first_or_create(name: :admin)
