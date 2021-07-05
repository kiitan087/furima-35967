class CreateDestinations < ActiveRecord::Migration[6.0]
  def change
    create_table :destinations do |t|
      t.string  :zip,           null: false
      t.integer :shipping_area, null: false
      t.string  :city,          null: false
      t.string  :block,         null: false
      t.string  :building,      null: false
      t.string  :phone_number,  null: false
      t.references :order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
