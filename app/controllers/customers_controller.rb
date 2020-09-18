class CustomerController < ApplicationController

  get "/customers" do
    @customers = Customer.all
    erb :'customers/index'
  end

  get "/customers/new" do
    erb :'customers/new'
  end

  get "/customers/:slug" do
    @customer = Customer.find_by_slug(params[:slug])
    erb :'customers/show'
  end

  post "/customers" do
    customer = Customer.create(name: params[:name], total_fees: 0)
    redirect "/customers/#{customer.slug}"
  end

  get "/customers/:slug/edit" do
    @customer = Customer.find_by_slug(params[:slug])
    erb :'customers/edit'
  end

  patch "/customers/:slug" do
    customer = Customer.find_by_slug(params[:slug])
    customer.update(params[:customer])
    redirect "/customers/#{customer.slug}"
  end
end
