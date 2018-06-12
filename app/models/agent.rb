class Agent < ActiveRecord::Base
  has_many :convocations
  has_many :convictions
  has_many :flags
  has_many :restrictions
  has_many :archives, as: :archives

  belongs_to :station
  
  has_one :citizen

  validates_uniqueness_of :id_card_number, :phone_number, :email
  validates :phone_number, numericality: { only_integer: true }, length: { is: 9 }
  validates :password, length: { minimum: 8 }
  validates_presence_of :id_card_number, :station_id, :username, :role, :full_name, :email, :service_id
  validate :role_choice, :station_choice, :no_capital_letters

  has_secure_password

  def role_choice
    if role.present? && role == 'choose'
      errors.add(:role, 'Please choose a role')
    end
  end

  def station_choice
    if station_id.present? && station_id == 'choose'
      errors.add(:station_id, 'Please choose a station')
    end
  end

  def no_capital_letters
    if username.present? && username.match(/[A-Z]/)
      errors.add(:username, "can't have capital letter(s)")
    end
  end

  #remember to change the email verification status to false, later on when the
  # system is set up and running
end
