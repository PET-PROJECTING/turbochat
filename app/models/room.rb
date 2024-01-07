class Room < ApplicationRecord
  # Relations
  has_many :messages
  has_many :participants, dependent: :destroy
  # Validations
  validates_uniqueness_of :name

  # Hooks
  after_create_commit { broadcast_if_public }
  # after_create_commit { broadcast_prepend_to "rooms" }

  # Scopes
  scope :public_rooms, -> { where(is_private: false) } # TODO: use like in teladoc statemachine or maybe enum

  def broadcast_if_public = (broadcast_prepend_to "rooms" unless is_private)
  def last_message = messages.order(created_at: :desc ).first

  def self.create_private_room(users, room_name)
    single_room = Room.create(name: room_name, is_private: true)
    users.each { |user| Participant.create(user_id: user.id, room_id: single_room.id) }

    return single_room
  end
end
