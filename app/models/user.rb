class User < ActiveRecord::Base

  has_secure_password

  has_many :reviews, through: :products
  has_many :order
end
