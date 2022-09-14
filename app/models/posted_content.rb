class PostedContent < ApplicationRecord

  belongs_to :category
  belongs_to :time_of_day

  has_one_attached :posted_content_image

end
