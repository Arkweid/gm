class Guild < ApplicationRecord
  belongs_to :user
  belongs_to :game
  has_many :characters
  has_many :invites

  validates :user_id, :game_id, :title, presence: true

  scope :search_guild, ->(search) { where('title LIKE ?', "%#{search}%") }

  def get_emblem_link
    emblem_link.blank? ? "guild_default_emblem.png" : emblem_link
  end
end
