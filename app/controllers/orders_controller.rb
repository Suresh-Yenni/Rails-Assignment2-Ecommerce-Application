class OrdersController < ApplicationController

  def home
  end

  def index
    cus_name = Orders.pluck(:customers_id).map { |id| Customers.find(id).name }
    itm_name = Orders.pluck(:items_id).map { |id| Items.find(id).item_name }
    @details = cus_name.zip(itm_name)
  end

  def new
    @orders = Orders.new
    @customers = Customers.all
    @items = Items.all
  end

  def create
    @orders = Orders.new(params[:orders])
    @orders.save
    redirect_to orders_home_path
  end

  def destroy
    @orders = Orders.find(params[:id])
    cust_id = @orders.customers_id
    @orders.destroy
    redirect_to customer_path(cust_id)
  end


end
