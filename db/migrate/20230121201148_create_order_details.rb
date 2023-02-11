class CreateOrderDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :order_details do |t|
      t.belongs_to :order, null: false, foreign_key: true
      t.string :first_name, null: true
      t.string :last_name, null: true
      t.string :email, null: true
      t.belongs_to :address, null: false, foreign_key: true

      t.timestamps
    end
  end
end
