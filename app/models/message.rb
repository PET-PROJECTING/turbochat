class Message < ApplicationRecord
  # Relations
  belongs_to :user
  belongs_to :room

  # Validations
  validates_presence_of :body

  # Hooks
  after_create_commit { broadcast_append_to self.room }
end
