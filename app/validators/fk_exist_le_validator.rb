
class FkExistLeValidator < ActiveModel::Validator

  def validate(record)

      d  = Day.find_by_id(record.day_id)
      p  = Plkst.find_by_id(record.plkst_id)
      c  = Cabinet.find_by_id(record.cabinet_id)
      tr = TeachingRelation.find_by_id(record.teaching_relation_id)

      unless d 
	  record.errors[:day] << ' doesnt seem to exit in DB. (from custom validator)'
      end

      unless p 
	  record.errors[:plkst] << ' doesnt seem to exit in DB. (from custom validator)'
      end

      unless c 
	  record.errors[:cabinet] << ' doesnt seem to exit in DB. (from custom validator)'
      end

      unless tr 
	  record.errors[:teaching_relation] << ' doesnt seem to exit in DB. (from custom validator)'
      end

  end

end
