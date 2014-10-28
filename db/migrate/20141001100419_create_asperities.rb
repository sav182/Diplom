class CreateAsperities < ActiveRecord::Migration
  def change
    create_table :asperities do |t|
      t.integer :number
      t.string :drawing
      t.string :form
      t.string :type
      t.timestamps
    end
  end
end
