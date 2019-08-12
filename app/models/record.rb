class Record < ApplicationRecord
	acts_as_paranoid
	has_many :tune ,dependent: :destroy
end
