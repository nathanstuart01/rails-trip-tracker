class Location < ApplicationRecord
  validates_presence_of :destination, :travel_method

  belongs_to :trip
  has_many :addresses

  def self.travel_methods
    ['walk', 'fly', 'drive', 'train']
  end

end
