class TweetTeachersController < ApplicationController
    before_action :authenticate_teacher!
    def show
        # id = params[:id].select(id)
        @final = Final.where( student_id: params[:id]).last
        @middle = Middle.where( student_id: params[:id] ).last
        @subjects = Subject.where( student_id: params[:id] )
        @todos = Todo.where( student_id: params[:id] )
        @student = Student.find( params[:id])
        @tweet_students = TweetStudent.where( student_id: params[:id] )
        @teacher = Teacher.find(current_teacher.id)
        
    end

    def index
        @teacher = Teacher.find(current_teacher.id)
        @students = Student.where( teacher_id: current_teacher.id)
        @schedules = Schedule.where( teacher_id: current_teacher.id).all
    end
    
    def all_destroy
        tweet_students = TweetStudent.where(student_id: params[:id]).without_deleted
        tweet_students.each do |t|
            t.destroy
        end
        redirect_to tweet_teacher_path(params[:id])
    end

    def history_index
        @middles = Middle.where( student_id: params[:id]).all
        @student = Student.find(params[:id])
    end

    def history_show
        @final = Final.where( student_id: params[:student_id]).last
        @middles = Middle.where( student_id: params[:student_id] ).all
        @subjects = Subject.where( student_id: params[:student_id] )
        @student = Student.find( params[:student_id])
        @tweet_students = TweetStudent.where( student_id: params[:student_id] ).with_deleted
        @middle = Middle.find(params[:id])
    end

    def physical_destroy
        tweet_students = TweetStudent.where(middle_id: params[:middle_id]).with_deleted
        tweet_students.each do |t|
            t.really_destroy!
        end
        middle = Middle.find(params[:middle_id])
        middle.destroy
        redirect_to history_index_tweet_teachers_path(params[:student_id])
    end

    
end
