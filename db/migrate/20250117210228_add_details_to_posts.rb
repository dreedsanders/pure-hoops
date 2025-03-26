class AddDetailsToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :category, :string
    add_column :posts, :subcategory, :string
  end
end
