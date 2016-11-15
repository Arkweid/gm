class Invite < ApplicationRecord
  belongs_to :character
  belongs_to :guild

  validates :character_id, :guild_id, presence: true

  # for state machine
  # suspense - устанавливается по дефолту. Ожидает хоть какой-то реакции.
  # approval - процесс рассмотрения инвайта. Голосуют и ругаются.
  # accepted - принят
  # reject - отклонен
  # rejection - самоотвод

  state_machine :state do
    event :approval do
      transition :suspense => :approval
    end

    event :accepted do
      transition :approval => :accepted
    end

    event :reject do
      transition :approval => :reject
    end

    event :rejection do
      transition any => :rejection
    end
  end
end
