class AddTixToUser < ActiveRecord::Migration
  def change
  	add_column :users, :tix, :integer, :default => 0
  end
end
