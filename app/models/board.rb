class Board < ApplicationRecord
  has_many :artists, dependent: :destroy
end
