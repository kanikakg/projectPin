class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.integer :board_id

      t.timestamps null: false
    end
  end
end
