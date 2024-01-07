class Room < ApplicationRecord
  # Relations
  has_many :messages

  # Validations
  validates_uniqueness_of :name

  # Hooks
  after_create_commit { broadcast_prepend_to "rooms" }

  # Scopes
  scope :public_rooms, -> { where(is_private: false) } # TODO: use like in teladoc statemachine or maybe enum

  def last_message = messages.order(created_at: :desc ).first
end
