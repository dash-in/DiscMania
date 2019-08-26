class Tune < ApplicationRecord

	validates :tune_name, presence: true

	belongs_to :record
end
