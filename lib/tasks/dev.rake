namespace :dev do
  desc "Configura entorno de desarrollo"
  task setup: :environment do
    p "Reseteando data inicial..."
    %x(rails db:drop db:create db:migrate)
  	p "Registrando los tipos de contactos"

  	kinds = %w(Amigo Comercial Conocido)

  	kinds.each do |kind|
  		Kind.create!(
  			description: kind
  			)
  	end

  	p "Tipos de contacto registrados con éxito"

  	p "Registrando los contactos"

  	100.times do |i|
  		Contact.create!(
  			name: Faker::Name.name,
  			email:Faker::Internet.email,
  			birthdate: Faker::Date.between(65.years.ago, 18.years.ago), #=> "Wed, 24 Sep 2014"
  			kind: Kind.all.sample
  		)
  	end

  	p "Registro completado con éxito"

    p "Registrando los teléfonos"

    Contact.all.each do |contact|
      Random.rand(5).times do |i|
        contact.phones.create!(number: Faker::PhoneNumber.cell_phone)
      end
    end

    p "Registro completado con éxito"

    p "Registrando direcciones"

    Contact.all.each do |contact|
        Address.create!(
          street: Faker::Address.street_address,
          city: Faker::Address.city,
          contact: contact
          )
    end

    p "Registro completado con éxito"

  end
end
