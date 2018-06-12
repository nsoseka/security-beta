class Convocation < ApplicationRecord
  belongs_to :citizen
  belongs_to :agent
  belongs_to :station

  has_many :archives, as: :archive

  validates_presence_of :reason, :date_expected, :convoker_id, :citizen_id
  validates :convoker_id, numericality: { only_integer: true }, length: { is: 9}
  validate :existence_of_convokers_id

  before_save :not_same_person

  def existence_of_convokers_id
    if convoker_id.present? && Citizen.find_by(id_card_number: convoker_id).nil?
      errors.add(:convoker_id, 'This Id has not yet been registered on the system')
    end
  end

  def not_same_person
    puts "doing the check #{Citizen.find(citizen_id).id_card_number}, #{convoker_id}"
    if Citizen.find(citizen_id).id_card_number == convoker_id
      errors.add(:convoker_id, 'You cannot convoke yourself, can You?')
      throw :abort  
    end
  end
  # before_create :generate_code, :set_not_taken

  # validates_presence_of :description, :sender, :senders_number, 
  # :recipient, :recipients_number, :origin, :destination
  # validates :description, length: { minimum: 5 }
  # validates :recipients_number, :senders_number, length: { is: 9 }
end
