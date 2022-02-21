class CreateGoods < ActiveRecord::Migration[6.0]
  def change
    create_table :goods do |t|
      t.integer :comment_id
      t.integer :user_id

      t.timestamps
      t.index [:user_id, :comment_id], unique: true
    end
  end
end
