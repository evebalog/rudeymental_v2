class CreateCusswords < ActiveRecord::Migration
  def change
    create_table :cusswords do |t|
      t.string :word
      t.integer :rating

      t.timestamps null: false
    end
  end
end
