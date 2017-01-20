class Invite < ApplicationRecord
  acts_as_commentable :public, :private
  
  belongs_to :character
  belongs_to :guild

  validates :character_id, :guild_id, presence: true

  state_machine initial: :suspense do
    # инвайт принят гильдией на рассмотрение.
    event :approval do
      transition suspense: :approval
    end
    # персонаж принят
    event :accepted do
      transition approval: :accepted
    end
    # персонаж отклонен
    event :reject do
      transition approval: :reject
    end
    # самоотвод
    event :rejection do
      transition any => :rejection
    end
  end
end
