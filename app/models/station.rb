class Station < ApplicationRecord
  has_many :agents
  has_many :convocations
  has_many :flags
  has_many :restrictions
  
  belongs_to :region
  validates_presence_of :name, :location, :region, :kind
end
