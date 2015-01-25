class CreateMeds < ActiveRecord::Migration
  def change
    create_table :meds do |t|
      t.string :med_name
      t.string :med_class
      t.string :med_dosage
      t.string :med_use
      t.timestamps null: false
    end
  end
end
