class User < ApplicationRecord
  before_save { self.email.downcase! }
  attr_accessor :x, :y, :width, :height
  has_one_attached :image
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  has_secure_password
end
