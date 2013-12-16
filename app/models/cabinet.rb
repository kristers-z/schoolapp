class Cabinet < ActiveRecord::Base

    has_many :lessons

    validates :nr, presence: true, uniqueness: true, :inclusion => {:in => 1..100}

    before_destroy :does_have_dependencies

    private
    def does_have_dependencies
	if Lesson.where(:cabinet_id => self.id).limit(1).size > 0
	    self.errors[:base] << 'You must delete lessons at this cabinet first.'
	    return false
	end
    end
end
