class PostedContent < ApplicationRecord

  belongs_to :user
  belongs_to :category
  belongs_to :time_of_day
  has_many :favorites, dependent: :destroy
  has_many :posted_comments, dependent: :destroy
  has_many :reports, dependent: :destroy

  has_one_attached :image

  validates :title, presence: true
  validates :sentence, presence: true

  # すでに"いいね"しているかどうか判断するメソッド
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

end
