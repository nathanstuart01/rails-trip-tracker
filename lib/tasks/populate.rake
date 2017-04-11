namespace :populate do
  desc "Generate 5 Trip Names"
  task trips: :environment do
    user = User.first
    if user
      5.times do
        user.trips.create(name: Faker::GameOfThrones.city)
      end
    else
      raise 'No First User In The Database!'
    end
  end

end
