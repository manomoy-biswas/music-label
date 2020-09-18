class CreatePerformances < ActiveRecord::Migration[6.0]
  def change
    create_table :performances do |t|
      t.references :user,        null: false, foreign_key: true
      t.references :event,       null: false, foreign_key: true
      t.string     :title,       null: false, limit: 255
      t.text       :description, null: true
      t.string     :attchment,   null: false
      

      t.timestamps
    end
  end
end
