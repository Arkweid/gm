class CharacterNote < ApplicationRecord
  belongs_to :character
  belongs_to :user

  validates :character_id, :user_id, :note, presence: true    
end
