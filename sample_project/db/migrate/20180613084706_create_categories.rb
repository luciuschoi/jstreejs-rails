class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :title
      t.text :description
      t.boolean :favorite, default: false

      t.timestamps
    end
  end
end
