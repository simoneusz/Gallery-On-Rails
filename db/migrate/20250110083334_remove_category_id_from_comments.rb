class RemoveCategoryIdFromComments < ActiveRecord::Migration[8.0]
  def change
    remove_column :comments, :category_id, :integer
  end
end
