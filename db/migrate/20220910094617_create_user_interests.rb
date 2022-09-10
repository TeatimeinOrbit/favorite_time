class CreateUserInterests < ActiveRecord::Migration[6.1]
  def change
    create_table :user_interests do |t|

      t.integer :user_id, null: false
      t.integer :category_id, null: false
      ##興味度合を数値で格納するカラム
      #limitを53にしてdouble型として扱っている
      t.float :interest_degree, null: false, default: 0, limit: 53

      t.timestamps
    end
  end
end
