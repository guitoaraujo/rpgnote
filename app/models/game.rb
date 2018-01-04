class Game < ApplicationRecord
  belongs_to :user
  has_many :notes, dependent: :destroy

  validates :name, :description, presence: true
  validates :name, length: { minimum: 5, maximum: 50 }
  validates :description, length: { minimum: 30 }

  enum system: [:old_dragon, :gurps, :dd3_5, :dd4, :dd5]
  enum privacy: [:public, :restricted, :private], _prefix: true
end
