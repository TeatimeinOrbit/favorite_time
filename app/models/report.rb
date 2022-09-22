class Report < ApplicationRecord

  # 通報したユーザーID, 通報されたコンテンツID
  belongs_to :user
  belongs_to :posted_content

end
