class AddImageToImages < ActiveRecord::Migration[8.0]
  def change
    add_column :images, :image, :string
  end
end
