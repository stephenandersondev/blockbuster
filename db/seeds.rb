# Movie.destroy_all
# Customer.destroy_all
# Rental.destroy_all

# 30.times do
#   Movie.create(name: Faker::Movie.title)
# end

# 30.times do
#   Customer.create(name: Faker::Name.name, total_fees: 0)
# end

50.times do
Rental.create(customer_id: Customer.all.sample.id, movie_id: Movie.all.sample.id, returned: false)
end