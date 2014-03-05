class CreateVeryLoots < ActiveRecord::Migration
  def change
    create_table :very_loots do |t|
      t.integer :user_id
      t.integer :amount
      t.datetime :such_date

      t.timestamps
    end
  end
end
