class CreateLikes < ActiveRecord::Migration[8.0]
  def change
    create_table :likes do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :record, polymorphic: true, null: false
      t.integer :likes_count, default: 0

      t.timestamps
    end
  end
end
