class Restriction < ApplicationRecord
  belongs_to :citizen
  belongs_to :agent 
  belongs_to :station

  has_many :archives, as: :archive
  
  validates_presence_of :description, :genre
  validate :genre_choice

  def genre_choice
    if genre.present? && genre == 'choose'
      errors.add(:genre, 'Please choose a Genre/Type of restriction')
    end
  end
end
