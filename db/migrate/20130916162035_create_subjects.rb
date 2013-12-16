class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|

	#latvijas un pasaules vesture - longest subject. 29 chars.
	t.string :subject, :limit => 30

    end
  end
end
