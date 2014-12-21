class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.string :name
      t.string :drawing
      t.string :inventory_number
      t.belongs_to :product, index: true
      t.belongs_to :asperity, index: true
      t.belongs_to :machine, index: true
      t.belongs_to :device, index: true
      t.belongs_to :plan, index: true
      t.timestamps
    end
  end
end
