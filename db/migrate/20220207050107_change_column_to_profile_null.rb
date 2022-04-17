class ChangeColumnToProfileNull < ActiveRecord::Migration[6.0]
  def up
    change_column_null :profiles, :first_name, null: true
    change_column_null :profiles, :last_name, null: true
    change_column_null :profiles, :first_name_kana, null: true
    change_column_null :profiles, :last_name_kana, null: true
    change_column_null :profiles, :nickname, null: true
    change_column_null :profiles, :birthday, null: true
    change_column_null :profiles, :phone_number, null: true
    change_column_null :profiles, :prefectures, null: true
  end

  def down
    change_column_null :profiles, :first_name, null: false
    change_column_null :profiles, :last_name, null: false
    change_column_null :profiles, :first_name_kana, null: false
    change_column_null :profiles, :last_name_kana, null: false
    change_column_null :profiles, :nickname, null: false
    change_column_null :profiles, :birthday, null: false
    change_column_null :profiles, :phone_number, null: false
    change_column_null :profiles, :prefectures, null: false
  end
end
