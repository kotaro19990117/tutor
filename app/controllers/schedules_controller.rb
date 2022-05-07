class SchedulesController < ApplicationController
    def new
        @schedule = Schedule.new
        @schedule.teacher_id = params[:teacher_id]
        @students = Student.where( teacher_id: params[:teacher_id])
    end

    def show
        @schedule = Schedule.find(params[:id])
    end
    
    def create
        schedule = Schedule.new(schedule_params)
        if schedule.save
            redirect_to tweet_teachers_path
        else
            redirect_to new_schedule_path
        end
    end
    
    def destroy
        schedule = Schedule.find(params[:id])
        schedule.destroy
        redirect_to tweet_teachers_path
    end
    
    def edit
        @students = Student.where( teacher_id: params[:teacher_id])
        @schedule = Schedule.find(params[:id])
    end
    
    def update
        schedule = Schedule.find(params[:id])
        if schedule.update(schedule_params)
            redirect_to tweet_teachers_path
        else
            redirect_to edit_schedule_path
        end
    end
    
    private
    
    def schedule_params
        params.require(:schedule).permit(:student_id, :content, :start_time, :teacher_id)
    end
    
end
