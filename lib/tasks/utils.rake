namespace :utils do
  desc "TODO"
  task seed: :environment do
    puts "Gerando Contatos(Contacts) ..."
    10.times do |i|
      Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        kind: Kind.all.sample,
        rmk: Faker::Lorem.sentence(3, true)
      )
    end
    puts "Gerando Contato(Contacts) .... OK"

    puts "Gerando Enderecos(Enderecos) ..."
    Contact.all.each do |contact|
      Address.create!(
        street: Faker::Address.street_address,
        city:Faker::Address.city,
        contact: Contact.all.sample
      )
    end
  puts "Gerando Enderecos(Address) .... OK"

  puts "Gerando Telefones(Phones) ..."
  Contact.all.each do |contact|
    Random.rand(1..4).times do |i|
    Phone.create!(
      phone: Faker::PhoneNumber.cell_phone,
      contact: contact
      )
      end
    end
    puts "Gerando Telefones(Phones) .... OK"


  end

end
