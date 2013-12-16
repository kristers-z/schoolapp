class Teacher < ActiveRecord::Base

    has_many :teaching_relations

    validates :first_name, presence: true, length: {maximum: 30}
    validates :last_name,  presence: true, length: {maximum: 30}
    
    # There is a possibility of two teachers with the exact same first and last name, so dont have to scope this
    #validates :first_name, uniqueness: {scope: :last_name}

    before_destroy :does_have_dependencies

    private
    def does_have_dependencies
	if TeachingRelation.where(:teacher_id => self.id).limit(1).size > 0
	    self.errors[:base] << 'You must delete teaching_relations containing this teacher first.'
	    return false
	end
    end

end
