class PostedContent < ApplicationRecord

  has_many :categories
  has_many :time_of_days

  has_one_attached :posted_content_image

end
