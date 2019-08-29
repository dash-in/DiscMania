class Record < ApplicationRecord
	acts_as_paranoid

	validates :name, presence: true, uniqueness: true
	validates :label, presence: true
	validates :price, presence: true
	validates :genre, presence: true
	validates :stock, presence: true
	validates :artist_id, presence: true
	
	has_many :tunes
	has_many :record_imgs
	has_many :order_details
	has_many :cart_items
	has_many :reviews
	
	belongs_to :artist
	has_one :cart_item
	
	accepts_nested_attributes_for :tunes, allow_destroy: true
	accepts_nested_attributes_for :record_imgs, allow_destroy: true

end
