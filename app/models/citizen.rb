class Citizen < ApplicationRecord
  has_many :convocations, ->{ order "date_expected ASC" }
  has_many :convictions , ->{ order "created_at DESC" }
  has_many :flags, ->{ order "created_at DESC" }
  has_many :restrictions, ->{ order "created_at DESC" }
  
  has_one_attached :avatar

  validates_presence_of :surname, :given_names, :father, :mother, :occupation, :address, :height,
                        :sex, :sp, :id_card_number, :date_issued, :expiry_date, :avatar, :born_at
  validates :id_card_number, numericality: { only_integer: true }, length: { is: 9 }
  validates_uniqueness_of :id_card_number
  validate :avatar_presence

  after_rollback :remove_blob_if_not_attached, on: :create

  scope :with_eager_loaded_avatar, -> { eager_load(avatar_attachment: :blob) }
  scope :with_preloaded_avatar, -> { preload(avatar_attachment: :blob) }

  ransacker :full_name do |parent|
    Arel::Nodes::InfixOperation.new('||',
      parent.table[:surname], parent.table[:given_names])
  end


  def remove_blob_if_not_attached
    avatar.purge
  end

  def avatar_presence
    if !avatar.attached?
      errors.add(:avatar, 'not provided')
    end

    if avatar.attached? && !avatar.attachment.blob.content_type.in?(%w(image/png image/jpeg))
        errors.add(:avatar, 'Must be an image file')
    end
  end
end

# NON_VALIDATABLE_ATTRS = ["id", "created_at", "updated_at"]
# VALIDATABLE_ATTRS = Citizen.attribute_names.reject{|attr| NON_VALIDATABLE_ATTRS.include?(attr)}
# when search all names is implemented refactor all the code and remove the useless blog

#removed
# scope :search_all_names, -> (query) { where("lower(surname || given_names) LIKE '%#{sanitize_sql_like(query)}%'") }
# scope :search_citizen, -> (query) { search_all_names(query) } 
#scope :ransack_search, -> (query)
#search_by_surname(query).or(search_by_given_names(query)).or(
# scope :search_by_surname, -> (query) { where("lower(surname) LIKE '%#{sanitize_sql_like(query)}%'") }
# scope :search_by_given_names, -> (query) { where("lower(given_names) LIKE '%#{sanitize_sql_like(query)}%'") }