class CreateTeachingRelations < ActiveRecord::Migration
  def change
    create_table :teaching_relations do |t|

	t.references :grade
	t.references :subject
	t.references :teacher

    end
  end
end
