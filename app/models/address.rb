class Address < ApplicationRecord
  validates_presence_of :city, :state, :street, :zip

  belongs_to :location

end
