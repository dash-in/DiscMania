class Record < ApplicationRecord
	acts_as_paranoid

	has_many :tunes ,dependent: :destroy
	belongs_to :artist

	attachment :image

	accepts_nested_attributes_for :tunes, allow_destroy: true

	def self.search(search)
		return Record.all unless search
		Record.where(['name LIKE ? OR artist.name LIKE ? OR genre LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%"])
	end

end
