class CreateReports < ActiveRecord::Migration[6.1]
  def change
    create_table :reports do |t|
      
    t.integer :user_id
    t.integer :comment_id
    
    t.timestamps
    end
  end
end
