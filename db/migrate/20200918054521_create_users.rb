class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string  :name,            null:false, limit: 50
      t.string  :email,           null:false, limit: 50
      t.string  :mobile,          null:false, limit: 10
      t.boolean :admin,           defalt: false
      t.string  :password_digest, null: false
      t.string  :auth_token, null: true

      t.timestamps
    end
  end
end
