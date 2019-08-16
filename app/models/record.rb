class Record < ApplicationRecord
	acts_as_paranoid

	has_many :tunes ,dependent: :destroy
	belongs_to :artist
	has_one :cart_items

	attachment :image

	accepts_nested_attributes_for :tunes, allow_destroy: true

end
