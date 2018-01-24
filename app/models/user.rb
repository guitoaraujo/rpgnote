class User < ApplicationRecord
  has_many :notes, dependent: :destroy
  has_many :gamers, dependent: :destroy
  has_many :games, dependent: :destroy
  has_many :games, through: :gamers

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end

