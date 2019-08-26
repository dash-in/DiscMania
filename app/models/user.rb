class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  attachment :image
  acts_as_paranoid


  has_many :cart_items
  has_many :shipping_infos
  has_many :orders
  has_many :reviews, dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :first_name_kana, presence: true, format: {with: /[\p{katakana}　ー－]+/}
  validates :last_name_kana, presence: true, format: {with: /[\p{katakana}　ー－]+/}
  validates :post_number, presence: true, format: {with: /\A\d{3}[-]\d{4}$|^\d{3}[-]\d{2}$|^\d{3}$|^\d{5}$|^\d{7}\z/ }
  validates :address, presence: true
  validates :tel, presence: true, format: { with: /\A\d+\d+\d+\z/ }
  validates :handlename, presence: true, format: {with: /\A[ -~]+\z/}, length: { in: 1..10 }


end
