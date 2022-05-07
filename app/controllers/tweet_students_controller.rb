class TweetStudentsController < ApplicationController
    before_action :authenticate_student!
    def index
        @student = Student.find(current_student.id)
        @tweet_students = @student.tweet_students.without_deleted
        @final = Final.where( student_id: Student.find(current_student.id) ).last
        @middle = Middle.where( student_id: Student.find(current_student.id)).last
        @subjects = Subject.where( student_id: Student.find(current_student.id))
        @todos = Todo.where( student_id: Student.find(current_student.id) )

        @teacher = Teacher.find_by(id: @student.teacher_id)

        @tweet_student_new = TweetStudent.new


        

    end
    
    def new
        @tweet_students = TweetStudent.new
        @tweet_students.num = params[:num]
        @middle = Middle.where( student_id: Student.find(current_student.id)).last
    end

    def create
        TweetStudent.create(tweet_student_params)
        @tweet_students = Student.find(current_student.id).tweet_students.without_deleted

        @student = Student.find(current_student.id)
        @tweet_students = @student.tweet_students.without_deleted
        @final = Final.where( student_id: Student.find(current_student.id) ).last
        @middle = Middle.where( student_id: Student.find(current_student.id)).last
        @subjects = Subject.where( student_id: Student.find(current_student.id))
        @todos = Todo.where( student_id: Student.find(current_student.id) )
        @teacher = Teacher.find_by(id: @student.teacher_id)
    end

    def edit
        @tweet_student = TweetStudent.find(params[:id])
    end

    def update
        tweet_student = TweetStudent.find(params[:id])
        if tweet_student.update(tweet_student_params)
            redirect_to :action => "index"
        else
            redirect_to :action =>  "edit"
        end
    end

    def destroy
        tweet_student = TweetStudent.find(params[:id])
        tweet_student.destroy
        redirect_to action: :index
    end

    def all_destroy
        tweet_students = TweetStudent.where(student_id: params[:student_id]).without_deleted
        tweet_students.each do |t|
            t.destroy
        end
        redirect_to action: :index
    end

    def history_index
        @middles = Middle.where( student_id: Student.find(current_student.id)).all
    end

    def history_show
        @student = Student.find(current_student.id)
        # student_id = @student.id
        @tweet_students = @student.tweet_students.where(middle_id: params[:id]).with_deleted
        # relation = Relation.find_by( student_id: Student.find(current_student.id) )
        @final = Final.where( student_id: Student.find(current_student.id) ).last
        @middles = Middle.where( student_id: Student.find(current_student.id)).all
        @subjects = Subject.where( student_id: Student.find(current_student.id))
        # @todos = Todo.where( student_id: Student.find(current_student.id) )
        @teacher = Teacher.find_by(id: @student.teacher_id)
        @middle = Middle.find(params[:id])
    end

    def physical_destroy
        tweet_students = TweetStudent.where(middle_id: params[:middle_id]).with_deleted
        tweet_students.each do |t|
            t.really_destroy!
        end
        middle = Middle.find(params[:middle_id])
        middle.destroy
        redirect_to action: :history_index
    end

    private
    def tweet_student_params
        params.require(:tweet_student).permit(:body, :student_id, :num, :achivement, :image, :notget, :middle_id)
    end

end


