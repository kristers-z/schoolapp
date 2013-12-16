class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|

	t.references :day
	t.references :plkst
	t.references :cabinet
	t.references :teaching_relation

    end
  end
end
