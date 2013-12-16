class TeachersController < ApplicationController

    def create
	obj = Teacher.new(params[:teacher].permit(:first_name, :last_name))

	json = {'plural'   => obj.class.name.pluralize.underscore.downcase,
		'singular' => obj.class.name.underscore.downcase
	       }
	
	if obj.save
	    # path will ground us
	    json['path']     = teachers_path
	    json['ruby_obj'] = obj
	    render json: json, status: :ok
	else
	    json['errors']   = obj.errors.full_messages.join(' and ')
	    json['colspan']  = obj.attributes.size
	    render json: json, status: :unprocessable_entity
	end
    end

    def destroy
	obj = Teacher.find_by_id(params[:id])

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
