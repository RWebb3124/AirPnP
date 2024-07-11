class AddCoordinatesToPools < ActiveRecord::Migration[7.1]
  def change
    add_column :pools, :latitude, :float
    add_column :pools, :longitude, :float
  end
end
