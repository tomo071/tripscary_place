class CreateCurrentLocations < ActiveRecord::Migration[6.1]
  def change
    create_table :current_locations do |t|

      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
