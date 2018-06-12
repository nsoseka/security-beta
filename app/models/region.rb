class Region < ApplicationRecord
  has_many :stations
  validates_uniqueness_of :code, :name 
  validates_presence_of :code, :name
end
