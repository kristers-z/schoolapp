class AdminsController < ApplicationController

    def education_data
	@teaching_relations = TeachingRelation.all
	@subjects           = Subject.all
	@grades             = Grade.all
	@teachers           = Teacher.all
	@plksts             = Plkst.all
	@cabinets           = Cabinet.all
	@days               = Day.all
    end

    def permanent
	days               = Day.order("id") 
	plksts             = Plkst.order("plkst") 
	grades             = Grade.order("number, letter") 

	if grades.size > 0 && days.size > 0 && plksts.size > 0
	    @days    = days
	    @plksts  = plksts
	    @grades  = grades
	    @lessons = Lesson.all
	    @lesson  = Lesson.new
	end
    end
end
