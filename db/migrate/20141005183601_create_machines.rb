class CreateMachines < ActiveRecord::Migration
  def change
    create_table :machines do |t|
      t.string :name
      t.string :model
      t.string :type_machine
      t.string :type_poverh
      t.string :form_poverh
      t.float :cleanliness
      t.float :complexity
      t.belongs_to :department, index: true
      t.belongs_to :asperity, index: true
      t.timestamps
    end
  end
end
