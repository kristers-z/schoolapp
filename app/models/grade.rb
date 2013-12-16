class Grade < ActiveRecord::Base

    has_many :teaching_relations

    validates :number, :inclusion  => {:in   => 1..12 }
    validates :letter, :length     => {:is    => 1}
    validates :number, :uniqueness => {:scope => :letter, :message => "and letter doesnt make uniq combination. Grade already exists."}

    before_destroy :does_have_dependencies

    private
    def does_have_dependencies
	if TeachingRelation.where(:grade_id => self.id).limit(1).size > 0
	    self.errors[:base] << 'You must delete teaching_relations containing this grade first.'
	    return false
	end
    end

end
