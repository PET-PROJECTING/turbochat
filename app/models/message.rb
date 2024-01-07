class Message < ApplicationRecord
  # Relations
  belongs_to :user
  belongs_to :room

  # Validations
  validates_presence_of :body

  # Hooks
  after_create_commit { broadcast_append_to self.room }
  before_create :confirm_participant

  def confirm_participant
    return unless room.is_private
    is_participant = Participant.find_by(user_id: user.id, room_id: room.id)

    throw :abort unless is_participant
  end
end
