class RentalController < ApplicationController
  get "/rentals" do
    @rentals = Rental.all
    erb :'rentals/index'
  end

  get "/rentals/new" do
    @movies = Movie.all.order(:name)
    @customers = Customer.all.order(:name)
    erb :'rentals/new'
  end

  get "/rentals/:id" do
    @rental = Rental.find(params[:id])
    erb :'rentals/show'
  end

  post "/checkin/:id" do
    rental = Rental.find(params[:id])
    rental.update(returned: true)
    difference = TimeDifference.between(rental.created_at, rental.updated_at).in_hours
    latefee = ((difference - 2.0) * 2.0).round(2)
    rental.customer.total_fees += latefee
    rental.customer.save
    redirect "/rentals"
  end

  post "/rentals" do
    customer = Customer.where(name: params[:customer])
    movie = Movie.where(name: params[:movie])
    Rental.create(movie_id: movie[0].id, customer_id: customer[0].id, returned: false)
    redirect "/rentals"
  end
end
