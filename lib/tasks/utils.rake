namespace :utils do
  desc "Populando o Banco para teste"
  task seed: :environment do
    puts "Gerando tipos de contatos - Contacts"
      10.times do |i|
      Contact.create(name: "Lidia",
                   email:"lidia@email.example.com",
                   kind: Kind.all.sample,
                  rmk: Faker::Lorem.paragraph([1,2])
                )
      end
    puts " OK"
    puts "Gerando Endereços - Address"
      Contact.all.each do |contact|
      Address.create!(street: Faker::Address.street_address,
                      city: Faker::Address.city,
                      state: Faker::Address.state_abbr,
                      contact: contact
                )
      end
    puts " OK"

    puts "Gerando Telefones - Phones"
      Contact.all.each do |contact|
        Random.rand(1..4).times do |i|
          Phone.create!(phone: Faker::PhoneNumber.phone_number,
                        contact: contact
                    )
         end
      end
    puts " OK"

  end

end
