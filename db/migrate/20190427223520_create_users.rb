# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name,  	null: false, default: ""
      t.string :cpf,   	null: false, default: ""
      t.string :email,	null: false, default: ""

      t.timestamps null: false
    end

		add_index :users, :cpf, 	unique: true
    add_index :users, :email, unique: true
  end
end