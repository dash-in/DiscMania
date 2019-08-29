class RecordImg < ApplicationRecord
	validates :order, presence: true
	validates :image, presence: true

    belongs_to :record
    
    attachment :image
end
