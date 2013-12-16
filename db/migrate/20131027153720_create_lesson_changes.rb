class CreateLessonChanges < ActiveRecord::Migration
  def change
    create_table :lesson_changes do |t|

	t.date :date
	t.references :cabinet
	t.references :plkst
	t.references :teaching_relation

    end
  end
end
