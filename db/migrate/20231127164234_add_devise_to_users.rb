# frozen_string_literal: true

class AddDeviseToUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email 

      t.timestamps

      ## Database authenticatable
      t.string :encrypted_password, null: false, default: ""

      ## Rememberable
      t.datetime :remember_created_at
    end

    add_index :users, :email, unique: true
  end
end
