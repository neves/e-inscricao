class CreateRentings < ActiveRecord::Migration[6.0]
  def change
    create_table :rentings do |t|
      t.date :begin_date, null: false
      t.date :end_date, null: false
      t.string :client_name, limit: 50, null: false

      t.timestamps
    end
    add_index :rentings, :begin_date
    add_index :rentings, :end_date
  end
end
