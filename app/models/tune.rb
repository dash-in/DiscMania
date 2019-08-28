class Tune < ApplicationRecord

	validates :tune_name, presence: true
	validates :disc_no, presence: true
	validates :tune_order, presence: true

	belongs_to :record
end
