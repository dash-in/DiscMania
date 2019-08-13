class Record < ApplicationRecord
	acts_as_paranoid

	has_many :tunes ,dependent: :destroy
	belongs_to :artist

	attachment :image

end
