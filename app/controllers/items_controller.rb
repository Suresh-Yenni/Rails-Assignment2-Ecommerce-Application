class ItemsController < ApplicationController

  def index
    @items = Items.all
  end

  def new
    @items = Items.new
  end

  def create
    @items = Items.new(params[:items])
    @items.save
    redirect_to items_path
  end

  def edit
    @items = Items.find(params[:id])
  end

  def update
    @items = Items.find(params[:id])
    @items.update_attributes(params[:items])
    redirect_to items_path
  end

  def destroy
    @orders = Orders.where(:items_id => params[:id])
    @orders.each do |order|
       order.destroy
    end
    @items = Items.find(params[:id])
    @items.destroy
    redirect_to items_path
  end
end
