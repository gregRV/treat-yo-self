class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
    	t.belongs_to :user
    	t.string :title
    	t.text :description
    	t.integer :reward

      t.timestamps
    end
  end
end
