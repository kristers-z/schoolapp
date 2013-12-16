class Day < ActiveRecord::Base

    has_many :lessons

    validates :day, :presence => true, :uniqueness => true, :length => {:maximum => 11}

    before_destroy :does_have_dependencies

    private
    def does_have_dependencies
	if Lesson.where(:day_id => self.id).limit(1).size > 0
	    self.errors[:base] << 'You must delete lessons at this day first.'
	    return false
	end
    end
end
