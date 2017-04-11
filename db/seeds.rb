User.create(
  first_name: 'Bob',
  last_name: 'Smith',
  email: 'bob@test.com',
  password: 'password'
)

4.times do
  Trip.create(
            name: "#{Faker::HarryPotter.location} Trip",
            user_id: User.first.id
            )
end

puts "Trips seeded, there are now #{Trip.count} trips in the database."

Trip.all.each do |trip|

  3.times do
      Location.create(
                  destination: Faker::StarWars.planet,
                  travel_method: Location.travel_methods.sample,
                  trip_id: trip.id
                  )
    end
  end

  puts "Locations seeded, there are now #{Location.count} locations in the database."

  Location.all.each do |location|

    1.times do
        Address.create(
                    city: Faker::Address.city,
                    state: Faker::Address.state,
                    street: Faker::Address.street_address,
                    zip: Faker::Address.zip,
                    location_id: location.id
                    )
      end
    end

  puts "Address seeded, there are now #{Address.count} addresses in the database."
