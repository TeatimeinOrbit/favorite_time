class CreateTimeOfDays < ActiveRecord::Migration[6.1]
  def change
    create_table :time_of_days do |t|

      t.string :name, null: false

      t.timestamps
    end
  end
end
