class News < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :user_id
  belongs_to :guild

  def publish
    update_attributes(published: true)
  end
end
