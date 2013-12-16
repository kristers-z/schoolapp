class CreateDays < ActiveRecord::Migration
  def change
    create_table :days do |t|

	#ceturtdiena - longest day, 11 chars
	t.string :day, :limit => 11

    end
  end
end
