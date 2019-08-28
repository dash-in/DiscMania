class Record < ApplicationRecord
	acts_as_paranoid

	validates :name, presence: true, uniqueness: true
	validates :image, presence: true
	validates :label, presence: true
	validates :price, presence: true
	validates :genre, presence: true
	validates :stock, presence: true
	validates :artist_id, presence: true

	has_many :tunes ,dependent: :destroy
	has_many :order_details
	has_many :cart_items

	has_many :reviews

	belongs_to :artist

	has_one :cart_item

	attachment :image

	accepts_nested_attributes_for :tunes, allow_destroy: true

end
