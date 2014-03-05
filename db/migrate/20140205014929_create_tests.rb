class CreateTests < ActiveRecord::Migration
  def change
    create_table :tests do |t|
      t.integer :num

      t.timestamps
    end
  end
end
