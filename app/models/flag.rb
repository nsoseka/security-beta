class Flag < ApplicationRecord
  belongs_to :citizen
  belongs_to :agent
  belongs_to :station

  has_many :archives, as: :archive

  validates_presence_of :reason, :severity
  validates :severity, numericality: { only_integer: true }, length: { is: 1}
end
