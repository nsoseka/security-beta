class Conviction < ApplicationRecord
  belongs_to :citizen
  belongs_to :agent
  validates_presence_of :charge, :sentence, :judge, :sentenced_on
  validates :judge, numericality: { only_integer: true }, length: { is: 9}
  validate :existence_of_judge

  def existence_of_judge
    if judge.present? && Agent.find_by(id_card_number: judge, role: 'judge').nil?
      errors.add(:judge, 'This person does not have the right to convict')
    end
  end
end
