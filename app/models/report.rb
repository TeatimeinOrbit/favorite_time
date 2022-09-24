class Report < ApplicationRecord

  # 通報したユーザーID, 通報されたコンテンツID
  belongs_to :reporter, class_name: "User"
  belongs_to :reported, class_name: "User"
  belongs_to :posted_content

end
