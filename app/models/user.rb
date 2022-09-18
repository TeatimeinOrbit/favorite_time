class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posted_contents, dependent: :destroy
  has_many :user_interests, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :posted_comments, dependent: :destroy

  #profile_imageはプロフィールアイコンの画像, header_imageはユーザーページ上部の画像
  has_one_attached :profile_image
  has_one_attached :header_image

  # ユーザーのプロフィール画像を取得するメソッド
  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/kkrn_icon_user_5.png')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/png')
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end



end
