class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :drawing
      t.string :inventory_number
      t.integer :amount_sections
      t.belongs_to :plan, index: true
      t.timestamps
    end
  end
end
