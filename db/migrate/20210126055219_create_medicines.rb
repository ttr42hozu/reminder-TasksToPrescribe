class CreateMedicines < ActiveRecord::Migration[6.0]
  def change
    create_table :medicines do |t|
      t.string :name,           null: false
      t.integer :usage_id,      null: false
      t.integer :dose_id,       null: false
      t.integer :day_id,       null: false
      t.references :patient, foreign_key: true
      t.timestamps

    end
  end
end
