class CustomersController < ApplicationController

  def index
    @customers = Customers.all
  end

  def new
    binding.pry
    @customers = Customers.new
  end

  def show
    orders = Orders.where(:customers_id => params[:id])
    temp1 = orders.pluck(:items_id)
    items = Items.find(temp1)
    orders = orders.select("customers_id").select("id").select("date")
    @details = orders.zip(items)
  end

  def create
    @customers = Customers.new(params[:customers])
    @customers.save
    redirect_to customers_path
  end

  def edit
    @customers = Customers.find(params[:id])
  end

  def update
    @customers = Customers.find(params[:id])
    @customers.update_attributes(params[:customers])
    redirect_to customers_path
  end

  def destroy
    @orders = Orders.where(:customers_id => params[:id])
    @orders.each do |order|
       order.destroy
    end
    @customers = Customers.find(params[:id])
    @customers.destroy
    redirect_to customers_path
  end

end
