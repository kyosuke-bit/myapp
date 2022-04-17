class RemoveImageFromMessages < ActiveRecord::Migration[6.0]
  def change
    remove_column :messages, :image, :string
  end
end
