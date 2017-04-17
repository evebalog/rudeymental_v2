class CreateTranslations < ActiveRecord::Migration
  def change
    create_table :translations do |t|
      t.integer :cussword_id
      t.string :hun_word
      t.string :french_word

      t.timestamps null: false
    end
  end
end
