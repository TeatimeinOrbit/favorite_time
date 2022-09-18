class PostedComment < ApplicationRecord

  belongs_to :user
  belongs_to :posted_content

end
