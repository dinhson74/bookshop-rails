class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.belongs_to :user
      t.belongs_to :book
      t.string     :description
      t.datetime   :date_order
      t.timestamps
    end
  end
end
