class AddUidAndAvatarUrlToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :uid, :string, null: false, default: '0'
    add_column :users, :avatar_url, :string
  end
end
