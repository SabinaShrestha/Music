class Artist < ApplicationRecord
  belongs_to :board
  has_many :songs, dependent: :destroy
end
