class CreateReports < ActiveRecord::Migration[6.1]
  def change
    create_table :reports do |t|

      # 足したカラム(通報理由, 通報したユーザーID, 通報されたコンテンツID)
      t.text :reason, null: false
      t.integer :user_id, null: false
      t.integer :posted_content_id, null: false

      t.timestamps
    end
  end
end
