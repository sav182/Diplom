class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.integer :name
      t.integer :year
      t.references :product, index: true
      t.references :section, index: true
      t.timestamps
    end
  end
end
