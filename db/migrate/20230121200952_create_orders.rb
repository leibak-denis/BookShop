class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.string :status
      t.datetime :ordered_at

      t.timestamps
    end
  end
end
