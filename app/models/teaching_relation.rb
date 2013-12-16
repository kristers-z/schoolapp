class TeachingRelation < ActiveRecord::Base

    has_many :lessons

    belongs_to :grade
    belongs_to :subject
    belongs_to :teacher

    validates :grade_id,   presence:true
    validates :subject_id, presence:true
    validates :teacher_id, presence:true

    #Makes sure foreign keys actually do reference some existing data in their home tables.
    validates_with FkExistTrValidator

    #Cant enter exact duplicates of teaching relations
    validates :grade_id, uniqueness: {scope: [:subject_id, :teacher_id], message: ' already has this exact teaching relation'}




    before_destroy :does_have_dependencies

    private
    def does_have_dependencies
	if Lesson.where(:teaching_relation_id => self.id).limit(1).size > 0
	    self.errors[:base] << 'You must delete lessons containing this TeachingRelation first.'
	    return false
	end
    end
end
