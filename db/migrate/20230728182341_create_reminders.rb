class CreateReminders < ActiveRecord::Migration[6.1]
  def change
    create_table :reminders do |t|
      t.string :message
      t.integer :prescription_id
      t.timestamps
    end
  end
end
