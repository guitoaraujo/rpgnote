class Game < ApplicationRecord
  belongs_to :user
  has_many :gamers, dependent: :destroy
  has_many :notes, dependent: :destroy
  has_many :users, through: :gamers

  validates :name, :description, :system, :privacy, presence: true
  validates :name, length: { minimum: 5, maximum: 50 }
  validates :description, length: { minimum: 30 }

  enum system: [:old_dragon, :gurps, :dd3_5, :dd4, :dd5]
  enum privacy: [:public, :restricted, :private], _prefix: true

  after_save :set_gamer

  private

  def set_gamer
    Gamer.create(game_id: self.id, user_id: self.user_id)
  end
end
