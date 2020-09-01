namespace :dev do
  desc "Configura o Ambiente de Desenvolvimento"
  task setup: :environment do

    %x(rails db:drop db:create db:migrate)

    puts "Cadastrandos Tipo de Contatos"
    kinds = %w(Amigo Comercial Conhecido)
    kinds.each do |kind|
      Kind.create!(
        description: kind
      )
    end
    puts "Tipo de Contatos Cadastrados com sucesso"

    #############

    puts "Cadastrando Contatos ..."
    1.times do
      Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        bithdate: Faker::Date.between(65.years.ago, 18.years.ago),
        kind: Kind.all.sample
      )
    end
    puts "Contatos Cadastrados com sucesso !!!"

    #########################
    puts "Cadastrando os Phones"

    Contact.all.each do |contact|
      [1,2,3,4,5].sample.times do |i|
        Phone.create!(number: Faker::PhoneNumber.cell_phone, contact: contact)
      end
    end

    puts "Phones cadastrados com sucesso"
    #########################

    puts "Cadastrando Endereços"

    # Contact.all.each do |contact|
    #   Address.create!(street: Faker::Address::street_address,
    #       city: Faker::Address::city,
    #       contact: contact
    #   )
    # end

    puts "Endereços cadastrados com sucesso"

  end
end
