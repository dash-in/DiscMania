class Artist < ApplicationRecord
    acts_as_paranoid

    validates :name, presence: true, uniqueness: true

    has_many :records, dependent: :destroy
end
