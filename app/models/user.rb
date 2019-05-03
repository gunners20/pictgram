class User < ApplicationRecord
  validates :name, presence: true
                   length: { maximum: 15 }

  validates :email, presence: true
                    format: { with: /\A[\w]+@[\w]+\.[\w]+\z/i }

  validates :password, presence: true , uniqueness: true,
                       length: { minimum: 8, maximum: 32 }
                       format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,32}+\z/i }
  has_secure_password
end
