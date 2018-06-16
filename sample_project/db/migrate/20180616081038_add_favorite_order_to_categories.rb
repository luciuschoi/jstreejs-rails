class AddFavoriteOrderToCategories < ActiveRecord::Migration[5.2]
  def change
    add_column :categories, :favorite_order, :string
  end
end
