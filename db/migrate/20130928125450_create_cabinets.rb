class CreateCabinets < ActiveRecord::Migration
  def change
    create_table :cabinets do |t|

	t.integer :nr, limit: 1 

    end
  end
end
