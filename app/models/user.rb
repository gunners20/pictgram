class User < ApplicationRecord
  validates :name, presence: true,
                   length: { maximum: 15 }

  validates :email, presence: true,
                    format: { with: /\w+@\w+\.\w+/}

  validates :password, presence: true,
                       format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,32}+\z/i }
  has_secure_password

  has_many :topics
  has_many :comments
  has_many :favorites
  has_many :favorite_topics, through: :favorites, source: 'topic'
end
