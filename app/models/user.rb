class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable

  # Relations
  has_many :messages

  # Hooks
  after_create_commit { broadcast_prepend_to "users" }

  # Scopes
  scope :all_except, ->(user) { where.not(id: user) }

  def self.from_omniauth(access_token)
    data = access_token.info
    account = User.where(email: data['email']).first
    account ||= User.create(name: data['name'], email: data['email'], password: Devise.friendly_token[0, 20])
    account
  end
end
