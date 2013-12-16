class Subject < ActiveRecord::Base

    has_many :teaching_relations

    #subjects must be capitalized in controller I guess. Because 'math' and 'Math' are valid as two uniq recors. But they arent!!!
    validates :subject, :presence => true, :uniqueness => true, length: {maximum: 28}
    
    before_destroy :does_have_dependencies

    private
    def does_have_dependencies
	if TeachingRelation.where(:subject_id => self.id).limit(1).size > 0
	    self.errors[:base] << 'You must delete teaching_relations containing this subject first.'
	    return false
	end
    end

end
