class AddProdiverToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :provider, :string
  end
end
