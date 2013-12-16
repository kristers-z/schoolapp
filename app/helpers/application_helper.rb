module ApplicationHelper

    def errors_for(object)
	if object && object.errors.size > 0
	    render(:partial => 'shared/errors', :locals => {:object => object})
	end
    end

    def table_for(rows, textargs={}, selects={}, holds_errors=nil, switchpath=nil)
	render(:partial => 'shared/table',
	       :locals  => {
			    :rows         => rows,
			    :textargs     => textargs,
			    :holds_errors => holds_errors,
			    :selects      => selects,
			    :switchpath   => switchpath
			   }
	      ) 
    end
end

