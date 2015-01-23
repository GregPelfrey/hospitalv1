class CreateHospitals < ActiveRecord::Migration
  def change
    create_table :hospitals do |t|
      t.string   :name
      t.string   :address1
      t.string   :address2
      t.string   :city
      t.string   :state
      t.string   :zip 
      t.string   :phone

      t.timestamps null: false
    end
  end
end
