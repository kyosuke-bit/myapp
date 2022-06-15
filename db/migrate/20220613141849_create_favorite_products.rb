class CreateFavoriteProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :favorite_products do |t|
      t.string :product_name

      t.timestamps
    end
  end
end
