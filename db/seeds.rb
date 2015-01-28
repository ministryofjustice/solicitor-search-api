# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

1.upto(10) do
  #Seed with 10 firms
  firm_name = Faker::Company.name
  firm_address = Faker::Address.street_address + ' ' +Faker::Address.country
  firm_postcode = ('A'..'Z').to_a.sample + ('A'..'Z').to_a.sample + ('1'..'9').to_a.sample + ' ' + ('1'..'9').to_a.sample + ('A'..'Z').to_a.sample + ('A'..'Z').to_a.sample
  firm_tel = Faker::PhoneNumber.phone_number
  firm_email = Faker::Internet.email

  firm = Firm.where(email: firm_email ).first_or_create(
    name: firm_name,
    address: firm_address,
    postcode: firm_postcode,
    tel: firm_tel,
    email: firm_email)

  firm_id = firm.id
  #For each firm create 5 solicitors
  1.upto(5) do
    solicitor_name = Faker::Name.name
    solicitor_address = Faker::Address.street_address + ' ' + Faker::Address.country
    solicitor_postcode = ('A'..'Z').to_a.sample + ('A'..'Z').to_a.sample + ('1'..'9').to_a.sample + ' ' + ('1'..'9').to_a.sample + ('A'..'Z').to_a.sample + ('A'..'Z').to_a.sample
    solicitor_tel = Faker::PhoneNumber.phone_number
    solicitor_email = Faker::Internet.email

    Solicitor.where(email: solicitor_email ).first_or_create(
      name: solicitor_name,
      address: solicitor_address,
      postcode: solicitor_postcode,
      mobile: solicitor_tel,
      email: solicitor_email,
      firm_id: firm_id)
  end
end