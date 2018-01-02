class Game < ApplicationRecord
  belongs_to :user
  has_many :notes, dependent: :destroy

  validates :name, :description, presence: true
  validates :name, length: { minimum: 5, maximum: 50 }
  validates :description, length: { minimum: 30 }
end
