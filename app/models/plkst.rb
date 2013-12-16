class Plkst < ActiveRecord::Base

    has_many :lessons

    #Must validate format with regex aswell
    validates :plkst, presence: true, uniqueness: true
    validates :nr, :inclusion => {:in => 0..10}, uniqueness: true

    before_destroy :does_have_dependencies

    attr_accessor :minutes
    attr_accessor :hours 

    private
    def does_have_dependencies
	if Lesson.where(:plkst_id => self.id).limit(1).size > 0
	    self.errors[:base] << 'You must delete lessons at this plkst first.'
	    return false
	end
    end
end
