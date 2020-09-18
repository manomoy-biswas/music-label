class CreatePerformers < ActiveRecord::Migration[6.0]
  def change
    create_table :performers do |t|
      t.references :event, null: false, foreign_key: true
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
