class TeachersController < ApplicationController

    def setting
        @teacher = Teacher.find(params[:id])
    end
    def show
        @teacher = Teacher.find(params[:id])
        @student = Student.all
    end
end
