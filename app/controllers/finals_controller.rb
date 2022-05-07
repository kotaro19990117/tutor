class FinalsController < ApplicationController

    def new
        @final = Final.new
        @student = Student.find(params[:student_id])
    end

    def create
        final = Final.new(final_params)
        final.teacher_id = current_teacher.id
        if final.save
            redirect_to tweet_teacher_path(final.student_id)
        else
            redirect_to :action => "new"
        end
    end

    def edit
        @final = Final.find(params[:id])
    end

    def update
        final = Final.find(params[:id])
        if final.update(final_params)
            redirect_to tweet_teachers_path
        else
            redirect_to :action =>  "edit"
        end
    end

    def destroy
        final = Final.find(params[:id])
        final.destroy
        redirect_to tweet_teachers_path
    end


    private
    def final_params
        params.require(:final).permit(:body, :student_id)
    end

end
