class PostedContent < ApplicationRecord

  belongs_to :category
  has_many :time_of_days

  has_one_attached :posted_content_image

end
