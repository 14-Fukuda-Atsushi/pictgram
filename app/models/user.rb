class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name, presence: true
  validates :name, length: { in: 1..15 }
  validates :email, presence: true
  validates :email, format: { with: VALID_EMAIL_REGEX }
  validates :password, length: { in: 8..32 }
  validates :password, format: { with: /\A[a-zA-Z0-9]+\z/ }
  validates :password, format: { with: /[0-9]/ }
  validates :password, format: { with: /[a-zA-Z]/ }

  has_many :topics
  has_many :favorites
  has_many :favorite_topics, through: :favorites, source: 'topic'

  has_secure_password
end
