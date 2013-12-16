class PlkstsController < ApplicationController
    def create
	params[:plkst][:plkst] = params[:plkst][:minutes] + ':' + params[:plkst][:hours]

	obj = Plkst.new(params[:plkst].permit(:nr, :plkst))

	json = {'plural'   => obj.class.name.pluralize.underscore.downcase,
		'singular' => obj.class.name.underscore.downcase
	       }
	
	if obj.save
	    # path will ground us
	    json['path']     = plksts_path
	    json['ruby_obj'] = obj
	    render json: json, status: :ok
	else
	    json['errors']   = obj.errors.full_messages.join(' and ')
	    json['colspan']  = obj.attributes.size
	    render json: json, status: :unprocessable_entity
	end

    end

    def destroy
	obj = Plkst.find_by_id(params[:id])

	json = {'plural'   => obj.class.name.pluralize.underscore.downcase,
		'singular' => obj.class.name.underscore.downcase,
		'id'       => obj.id
	       }

	if obj && obj.destroy
	    render json: json, status: :ok
	else
	    json['colspan'] = obj.attributes.size
	    json['errors']  = obj.errors.full_messages.join(' and ')
	    render json: json, status: :unprocessable_entity
	end
    end
end
