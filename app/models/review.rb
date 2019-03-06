class Review < ApplicationRecord
  belongs_to :user
  belongs_to :tour
  has_many :likes, dependent: :destroy
end
