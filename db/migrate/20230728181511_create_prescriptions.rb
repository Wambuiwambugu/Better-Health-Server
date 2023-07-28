class CreatePrescriptions < ActiveRecord::Migration[6.1]
  def change
    create_table :prescriptions do |t|
      t.string :name
      t.string :dosage
      t.integer :duration
      t.string :instructions
      t.integer :user_id
      t.timestamps
    end
  end
end
