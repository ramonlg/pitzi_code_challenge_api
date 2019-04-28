# frozen_string_literal: true

class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
    	t.references :user, foreign_key: true
      t.string 	   :phone_model,  null: false, default: ""
      t.string 	   :imei, 				null: false, default: ""
      t.decimal    :annual_value, null: false, precision: 8, scale: 2
      t.integer    :installments, null: false, default: 1

      t.timestamps null: false
    end

    add_index :orders, :imei, unique: true
  end
end