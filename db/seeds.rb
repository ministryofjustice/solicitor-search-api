# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

1.upto(100) do
  #Seed with 10 firms
  firm_name = Faker::Company.name
  firm_address = Faker::Address.street_address + ' ' +Faker::Address.country
  firm_postcode = ('A'..'Z').to_a.sample + ('A'..'Z').to_a.sample + ('1'..'9').to_a.sample + ' ' + ('1'..'9').to_a.sample + ('A'..'Z').to_a.sample + ('A'..'Z').to_a.sample
  firm_tel = ['0207 284 1111','0207 284 2222','0207 284 3333','0207 284 4444','0207 284 5555','0207 284 6666'].sample
  firm_email = firm_name.downcase.gsub(/ /,'_').gsub(/\W/, '') + '@example.com'

  firm = Firm.where(email: firm_email ).first_or_create(
    name: firm_name,
    address: firm_address,
    postcode: firm_postcode,
    tel: firm_tel,
    email: firm_email)

  firm_id = firm.id

  #For each firm create 25 solicitors
  1.upto(25) do
    solicitor_name = Faker::Name.name
    solicitor_address = Faker::Address.street_address + ' ' + Faker::Address.country
    solicitor_postcode = ('A'..'Z').to_a.sample + ('A'..'Z').to_a.sample + ('1'..'9').to_a.sample + ' ' + ('1'..'9').to_a.sample + ('A'..'Z').to_a.sample + ('A'..'Z').to_a.sample
    solicitor_tel = ['0207 284 1111','0207 284 2222','0207 284 3333','0207 284 4444','0207 284 5555','0207 284 6666'].sample
    solicitor_email = solicitor_name.downcase.gsub(/ /,'_').gsub(/\W/, '') + '@example.com'

    Solicitor.where(email: solicitor_email ).first_or_create(
      name: solicitor_name,
      address: solicitor_address,
      postcode: solicitor_postcode,
      mobile: solicitor_tel,
      email: solicitor_email,
      firm_id: firm_id)
  end
end

#Create the 5 test solicitors
1.upto(5) do |n|
  solicitor_name = "Firstname#{n} Surname#{n}"
  solicitor_address = Faker::Address.street_address + ' ' + Faker::Address.country
  solicitor_postcode = ('A'..'Z').to_a.sample + ('A'..'Z').to_a.sample + ('1'..'9').to_a.sample + ' ' + ('1'..'9').to_a.sample + ('A'..'Z').to_a.sample + ('A'..'Z').to_a.sample
  solicitor_tel = ['0207 284 1111','0207 284 2222','0207 284 3333','0207 284 4444','0207 284 5555','0207 284 6666'].sample
  solicitor_email = "solicitor#{n}@example.com"
  firm_id = Firm.find(n)

  Solicitor.where(email: solicitor_email ).first_or_create(
    name: solicitor_name,
    address: solicitor_address,
    postcode: solicitor_postcode,
    mobile: solicitor_tel,
    email: solicitor_email,
    firm_id: firm_id)
end
