class Note < ApplicationRecord
  belongs_to :game
  belongs_to :user

  validates :name, :description, presence: true
  validates :name, length: { minimum: 5, maximum: 30 }
  validates :description, length: { minimum: 15 }

  enum privacy: [:public, :restricted, :private], _prefix: true
end
