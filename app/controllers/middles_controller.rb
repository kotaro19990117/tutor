class MiddlesController < ApplicationController


    def new
        @middle = Middle.new
        @student = Student.find(params[:student_id])
    end

    def create
        middle = Middle.new(middle_params)
        middle.teacher_id = current_teacher.id
        if middle.save
            redirect_to tweet_teacher_path(middle.student_id)
        else
            redirect_to :action => "new"
        end
    end

    def edit
        @middle = Middle.find(params[:id])
    end

    def update
        middle = Middle.find(params[:id])
        if middle.update(middle_params)
            redirect_to tweet_teachers_path
        else
            redirect_to :action =>  "edit"
        end
    end

    def destroy
        middle = middle.find(params[:id])
        middle.destroy
        redirect_to tweet_teachers_path
    end


    private
    def middle_params
        params.require(:middle).permit(:body, :student_id)
    end

end
