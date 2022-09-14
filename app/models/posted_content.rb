class PostedContent < ApplicationRecord

  belongs_to :user
  belongs_to :category
  belongs_to :time_of_day

  has_one_attached :image

end
