
class FkExistTrValidator < ActiveModel::Validator

  def validate(record)

      g = Grade.find_by_id(record.grade_id)
      s = Subject.find_by_id(record.subject_id)
      t = Teacher.find_by_id(record.teacher_id)

      unless g
	  record.errors[:grade] << ' doesnt seem to exit in DB. (from custom validator)'
      end

      unless s 
	  record.errors[:subject] << ' doesnt seem to exit in DB. (from custom validator)'
      end

      unless t 
	  record.errors[:teacher] << ' doesnt seem to exit in DB. (from custom validator)'
      end

  end

end
