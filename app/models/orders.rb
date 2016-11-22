class Orders < ActiveRecord::Base
  attr_accessible :date, :customers_id, :items_id
  belongs_to :items
  belongs_to :customers
end
