class CreateLinetrackersTable < ActiveRecord::Migration
  def change
    create_table :linetrackers do |t|
      t.string :name
      t.string :country
      t.string :currency
      t.float :amount
      t.string :date
      t.string :time
      t.text :notes
      t.integer :user_id
      t.timestamps null: true
    end
  end
end
