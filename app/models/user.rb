class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :characters, dependent: :destroy
  has_many :guilds, dependent: :destroy
  has_many :characters_notes, dependent: :destroy
  has_many :invites, through: :characters

  def owner_of?(object)
    object.user_id == id
  end
end
