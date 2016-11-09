class Guild < ApplicationRecord
  belongs_to :user
  belongs_to :game
  has_many :characters

  validates :user_id, :game_id, :title, presence: true

  def self.search(search)
    if search
      where('title LIKE ?', "%#{search}%")
    else
      all
    end
  end
end
