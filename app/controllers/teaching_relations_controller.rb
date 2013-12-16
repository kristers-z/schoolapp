class TeachingRelationsController < ApplicationController

    def create
	obj = TeachingRelation.new(params[:teaching_relation].permit(:grade_id, :subject_id, :teacher_id))

	json = {'plural'   => obj.class.name.pluralize.underscore.downcase,
		'singular' => obj.class.name.underscore.downcase
	       }
	
	if obj.save
	    # path will ground us
	    json['path']     = teaching_relations_path
	    json['ruby_obj'] = {'id'      => obj.id,
				'grade'   => obj.grade.number.to_s + '. ' + obj.grade.letter,
				'subject' => obj.subject.subject, 
				'teacher' => obj.teacher.first_name + ' ' + obj.teacher.last_name
			       } 

	    render json: json, status: :ok
	else
	    json['errors']   = obj.errors.full_messages.join(' and ')
	    json['colspan']  = obj.attributes.size
	    render json: json, status: :unprocessable_entity
	end
    end

    def destroy
	obj = TeachingRelation.find_by_id(params[:id])

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
