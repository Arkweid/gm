class Comment < ActiveRecord::Base
  belongs_to :commentable, polymorphic: true
  belongs_to :character

  validates :content, presence: true
end