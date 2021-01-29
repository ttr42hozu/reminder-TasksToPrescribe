class CreatePreparations < ActiveRecord::Migration[6.0]
  def change
    create_table :preparations do |t|
      t.references :user, foreign_key: true
      t.references :medicine, foreign_key: true
      t.timestamps
    end
  end
end
