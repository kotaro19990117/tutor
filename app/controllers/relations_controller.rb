class RelationsController < ApplicationController

    def create
        relation = current_teacher.relations.create(student_id: params[:student_id])
        redirect_back(fallback_location: root_path)
    end

    def destroy
        relation = Relation.find_by(student_id: params[:student_id], teacher_id: current_teacher.id)
        relation.destroy
        redirect_back(fallback_location: root_path)
    end

end
