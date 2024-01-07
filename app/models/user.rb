class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Relations
  has_many :messages

  # Hooks
  after_create_commit { broadcast_prepend_to "users" }

  # Scopes
  scope :all_except, ->(user) { where.not(id: user) }
end
