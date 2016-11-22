class Customers < ActiveRecord::Base
  attr_accessible :city, :email, :name, :pincode
  has_many :orders
end
