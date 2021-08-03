class Room < ApplicationRecord
    has_many :furniture

    validates :name, :m, :n, :furniture_count, presence: true
    validates :name, uniqueness: true
end
