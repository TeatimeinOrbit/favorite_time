class CreateReports < ActiveRecord::Migration[6.1]
  def change
    create_table :reports do |t|

      # 足したカラム(通報理由, 通報したユーザーID, 通報されたユーザーID, 通報されたコンテンツID)
      t.text :reason, null: false
      t.integer :reporter_id, null: false
      t.integer :reported_id, null: false
      t.integer :posted_content_id, null: false

      t.timestamps
    end
  end
end
