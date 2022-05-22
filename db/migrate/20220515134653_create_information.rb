class CreateInformation < ActiveRecord::Migration[6.1]
  def change
    create_table :information do |t|
      
      t.string :title
      t.text :body
      
      t.integer :user_id
      
      t.float :latitude
      t.float :longitude
      t.text :address

      t.timestamps
    end
  end
end
