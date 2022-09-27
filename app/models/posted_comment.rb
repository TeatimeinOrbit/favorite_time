class PostedComment < ApplicationRecord

  belongs_to :user
  belongs_to :posted_content

  validates :comment, presence: true, length: { minimum: 1, maximum: 100 }

end
