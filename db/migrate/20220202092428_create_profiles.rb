class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.references :user, null: false, foreign_key: true
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :first_name_kana, null: false
      t.string :last_name_kana, null: false
      t.string :nickname, null: false
      t.date :birthday, null: false
      t.string :phone_number, null: false
      t.string :prefectures, null: false

      t.timestamps
    end
  end
end
