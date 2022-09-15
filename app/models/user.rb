class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posted_contents, dependent: :destroy
  has_many :user_interests, dependent: :destroy
  has_many :favorites, dependent: :destroy

  #profile_imageはプロフィールアイコンの画像, header_imageはユーザーページ上部の画像
  has_one_attached :profile_image
  has_one_attached :header_image


end
