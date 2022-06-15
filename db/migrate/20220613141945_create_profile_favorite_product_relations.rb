class CreateProfileFavoriteProductRelations < ActiveRecord::Migration[6.0]
  def change
    create_table :profile_favorite_product_relations do |t|
      t.references :profile, null: false, foreign_key: true
      t.references :favorite_product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
