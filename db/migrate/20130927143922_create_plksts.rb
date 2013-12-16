class CreatePlksts < ActiveRecord::Migration
    def change
	create_table :plksts do |t|

	    t.integer :nr, :limit => 1
	    t.string :plkst, :limit => 5

	end
    end
end
