class CreatePositions < ActiveRecord::Migration
  def change
    create_table :positions do |t|
      t.string :title
      t.decimal :amount, precision: 10, scale: 2 
      t.date :due

      t.timestamps
    end
    add_index :positions, :due
  end
end
