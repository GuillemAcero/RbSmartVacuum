class Furniture < ApplicationRecord
  belongs_to :room, dependent: :destroy
end
