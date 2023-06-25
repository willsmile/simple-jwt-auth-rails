class CreateUsers < ActiveRecord::Migration[7.0]
  def up
    create_table :users, id: :bigint, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC", force: :cascade do |t|
      t.string :login_id, null: false
      t.string :password_digest, null: false
      t.string :nickname

      t.timestamps
    end
    add_index :users, :login_id, unique: true
  end

  def down
    drop_table :users, if_exists: true
  end
end
