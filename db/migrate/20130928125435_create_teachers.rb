class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|


	t.string :first_name, limit: 30 
	t.string :last_name, limit: 30

    end
  end
end
