class TodosController < ApplicationController

    def new
        @todo = Todo.new
        @todo.num = params[:num]
        @student = Student.find(params[:student_id])
    end

    def create
        todo = Todo.new(todo_params)
        todo.teacher_id = current_teacher.id
        if todo.save
            redirect_to tweet_teacher_path(todo.student_id)
        else
            redirect_to :action => "new"
        end
    end

    def edit
        @todo = Todo.find(params[:id])
    end

    def update
        todos = Todo.find(params[:id])
        if todo.update(todo_params)
            redirect_to tweet_teachers_path
        else
            redirect_to :action =>  "edit"
        end
    end

    def destroy
        todo = Todo.find(params[:id])
        todo.destroy
        redirect_to tweet_teachers_path
    end


    private
    def todo_params
        params.require(:todo).permit(:body, :student_id, :num)
    end

end
