class Note < ApplicationRecord
  belongs_to :game
  belongs_to :user

  validates :name, :content, presence: true
  validates :name, length: { minimum: 5, maximum: 30 }
  validates :content, length: { minimum: 10 }

  enum privacy: [:public, :restricted, :private], _prefix: true
end
