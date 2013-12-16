class LessonsController < ApplicationController

    def destroy 
	Lesson.find_by_id(params[:id]).destroy
	redirect_to(:controller => 'admins', :action => 'permanent')
    end

    def create

	@day_id = params[:lesson][:day_id]
	@plkst_id = params[:lesson][:plkst_id]
	@cabinet_id = params[:lesson][:cabinet_id]
	@tr_id = params[:lesson][:teaching_relation_id]

	@lesson = Lesson.new(params[:lesson].permit(:teaching_relation_id, :day_id, :plkst_id, :cabinet_id))

	if false 
	    redirect_to(:controller => 'admins', :action => 'permanent')
	else
	    @days               = Day.order("id") 
	    @plksts             = Plkst.order("plkst") 
	    @grades             = Grade.order("number, letter") 
	    @lessons            = Lesson.all
	    render('admins/permanent')
	end

    end

    # This doesnt really belong here. I guess I need public controller or smtng
    # this is outdated. Refer to admins/permanent for changes:
    # days plksts grades are read in Model.all and partial has been slightly changed
    def permanent
	@days               = []
	@plksts             = []
	@grades             = []
	@lessons            = Lesson.all

	Day.order("id").each {|d| @days << d.day}
	Grade.order("number, letter").each{|g| @grades << g.number.to_s + '. ' + g.letter}
	Plkst.order("plkst").each {|p| @plksts << p.plkst}
    end

end
