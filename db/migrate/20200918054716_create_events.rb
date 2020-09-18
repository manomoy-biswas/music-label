class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.references :user,        null: false, foreign_key: true
      t.string :event_name,      null:false, limit: 255
      t.text :event_description, null: false
      t.string :event_attachment, null: false
      t.datetime :published_at,  null: false

      t.timestamps
    end
  end
end
