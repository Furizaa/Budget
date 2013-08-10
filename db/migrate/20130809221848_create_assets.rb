class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets do |t|
      t.string :title
      t.decimal8 :amount
      t.decimal2 :amount
      t.date :due

      t.timestamps
    end
  end
end
