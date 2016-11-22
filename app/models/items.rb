class Items < ActiveRecord::Base
  attr_accessible :item_name, :price
  has_many :orders
end
