class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # ユーザーステータス(一般, 凍結解除請求者, 凍結されている, 永久凍結, 退会者, 通報され後判断待ち)
  enum status: { common: 0, requesting: 1, locked_out: 2, permanently_locked_out: 3, quit: 4, reported: 5}

  has_many :posted_contents, dependent: :destroy
  has_many :user_interests, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :posted_comments, dependent: :destroy
  has_many :reports

  # "フォローする", "フォローされる" の関係性
  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  #フォロー・フォロワー一覧画面で使用
  has_many :followings, through: :relationships, source: :followed
  has_many :followers, through: :reverse_of_relationships, source: :follower

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


  # フォローした時の処理
  def follow(user_id)
    relationships.create(followed_id: user_id)
  end

  # フォローを外す時の処理
  def unfollow(user_id)
    relationships.find_by(followed_id: user_id).destroy
  end

  # フォローしているか判定するメソッド
  def following?(user)
    followings.include?(user)
  end



end
