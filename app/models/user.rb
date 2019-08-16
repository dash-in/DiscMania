class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attachment :image
  acts_as_paranoid

<<<<<<< HEAD
  has_many :cart_items
=======
  has_many :shipping_infos
>>>>>>> master
end
