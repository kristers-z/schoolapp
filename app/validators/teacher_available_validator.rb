class TeacherAvailableValidator < ActiveModel::Validator

  def validate(record)

      # if theres something messed up with Foreign keys, then there wont be teaching_relation object
      # FksExistValidator will take care of that
      if record.teaching_relation

	  teacher_id = record.teaching_relation.teacher_id
	  day_id     = record.day_id
	  plkst_id   = record.plkst_id

	  lessons = Lesson.joins(:teaching_relation).where(["`lessons`.`day_id` = ? AND `lessons`.`plkst_id` = ? AND `teaching_relations`.`teacher_id` = ?", day_id, plkst_id, teacher_id])

	  unless lessons.size == 0 
	      record.errors[:teacher] << ' already has a lesson at given day and time.' 
	  end

      end

  end

end
