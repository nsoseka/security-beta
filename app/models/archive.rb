class Archive < ApplicationRecord
  belongs_to :archive, polymorphic: true

  validates_presence_of :agent_id 
  # validate :existence_of_agent

  # def existence_of_agent
  #   if agent_id.present? && Agent.find(agent_id).nil?
  #     errors.add(:agent_id, "You cannot perform this action")
  #   end
  # end
end
