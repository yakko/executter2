class CreateTranslations < ActiveRecord::Migration
  def self.up
    create_table :translations do |t|
      t.string :locale
      t.string :key
      t.text :text

      t.timestamps
    end
  end

  def self.down
    drop_table :translations
  end
end
