class SubjectsController < ApplicationController

    def new
        @subject = Subject.new
        @subject.num = params[:num]
        @student = Student.find(params[:student_id])
    end

    def create
        subject = Subject.new(subject_params)
        subject.teacher_id = current_teacher.id
        if subject.save
            redirect_to tweet_teacher_path(subject.student_id)
        else
            redirect_to :action => "new"
        end
    end

    def edit
        @subject = Subject.find(params[:id])
    end

    def update
        subject = Subject.find(params[:id])
        if subject.update(subject_params)
            redirect_to tweet_teachers_path
        else
            redirect_to :action =>  "edit"
        end
    end

    def destroy
        subject = Subject.find(params[:id])
        subject.destroy
        redirect_to tweet_teachers_path
    end


    private
    def subject_params
        params.require(:subject).permit(:body, :student_id, :num)
    end

end
