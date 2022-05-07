class StudentsController < ApplicationController
    def show
        @student = Student.find(params[:id])
        @teacher = Teacher.find(@student.teacher_id)
    end

    def callender
        @schedules = Schedule.where(student_id: current_student.id)
        @student = Student.find(current_student.id)
    end

end
