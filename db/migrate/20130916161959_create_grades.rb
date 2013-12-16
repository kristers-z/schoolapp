class CreateGrades < ActiveRecord::Migration
  def change
    create_table :grades do |t|

	# limit => 1 gives 'tinyint' datatype, maximum value is 127
	t.integer :number, :limit => 1
	t.string  :letter, :limit => 1
    end
  end
end
