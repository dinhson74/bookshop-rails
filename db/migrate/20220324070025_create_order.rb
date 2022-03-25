class CreateOrder < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.belongs_to :user
      t.belongs_to :book
      t.integer    :amount
      t.integer    :telephone
      t.string     :address
      t.integer    :status, default: 0
      t.string     :discount
      t.decimal    :total_money

      t.timestamps
    end
  end
end
