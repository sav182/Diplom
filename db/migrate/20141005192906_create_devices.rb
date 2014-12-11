class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.string :name
      t.string :model
      t.string :type_device
      t.string :type_poverh
      t.string :form_poverh
      t.float :cleanliness
      t.float :start_complexity
      t.float :end_complexity
      t.belongs_to :asperity, index: true
      t.belongs_to :department, index: true
      t.timestamps
    end
  end
end
