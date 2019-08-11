class Record < ApplicationRecord
	has_many :tune ,dependent: :destroy
end
