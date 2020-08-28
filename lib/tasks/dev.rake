namespace :dev do
  desc "Configura o Ambiente de Desenvolvimento"
  task setup: :environment do

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
    100.times do
      Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        bithdate: Faker::Date.between(65.years.ago, 18.years.ago),
        kind: Kind.all.sample
      )
    end
    puts "Contatos Cadastrados com sucesso !!!"


  end
end
