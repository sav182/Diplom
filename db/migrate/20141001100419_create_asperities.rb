class CreateAsperities < ActiveRecord::Migration
  def change
    create_table :asperities do |t|
      t.integer :number
      t.string :drawing
      t.string :form_poverh
      t.string :type_poverh
      t.float :complexity
      t.integer :cleanliness
      t.timestamps
    end
  end
end
