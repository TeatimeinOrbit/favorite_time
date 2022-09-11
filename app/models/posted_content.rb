class PostedContent < ApplicationRecord

  has_many :categories
  has_many :time_of_days

  has_one_attached :image

end
