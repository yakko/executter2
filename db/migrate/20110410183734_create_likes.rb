class CreateLikes < ActiveRecord::Migration
  def self.up
    create_table :likes do |t|
      t.integer :post_id
      t.integer :user_id
      t.boolean :generated_notifications, :default=>false

      t.timestamps
    end
  end

  def self.down
    drop_table :likes
  end
end
