class CreatePatients < ActiveRecord::Migration[6.0]
  def change
    create_table :patients do |t|
      t.string :medical_record_number, null: false
      t.string :last_name,             null: false
      t.string :first_name,            null: false
      t.references :user,              foreign_key: true
      t.timestamps
      
    end
  end
end
