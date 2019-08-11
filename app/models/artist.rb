class Artist < ApplicationRecord
    acts_as_paranoid

    validates :name, presence: true, uniqueness: true

    def self.search(search)
        if search
          Artist.where(['content LIKE ?', "%#{search}%"])
        else
          Artist.all
        end
    end
end
