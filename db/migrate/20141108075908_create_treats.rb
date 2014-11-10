class CreateTreats < ActiveRecord::Migration
  def change
    create_table :treats do |t|
    	t.belongs_to :user
    	t.string :title
    	t.text :description
    	t.integer :price
    	t.string :img_url

      t.timestamps
    end
  end
end
