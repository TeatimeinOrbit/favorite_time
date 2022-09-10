class CreatePostedContents < ActiveRecord::Migration[6.1]
  def change
    create_table :posted_contents do |t|

      t.integer :user_id, null: false
      t.integer :category_id, null: false, default: 0
      t.integer :time_of_day_id, null: false, default: 0  #時間帯を設定してもらうためのカラム
      t.string :title, null: false
      t.text :sentence, null: false

      t.timestamps
    end
  end
end
