class AddAtrsToUser < ActiveRecord::Migration
  def change
    add_column :users, :energy, :integer, :default => 1000
    add_column :users, :units, :integer, :default => 0
    add_column :users, :doge_spent, :decimal, :default => 0
    add_column :users, :damage_dealt, :integer, :default => 0
  end
end
