class ConversationsController < ApplicationController

    def show
        @conversation = Conversation.find(params[:id])
        @message = Message.new
        @messages = @conversation.messages
        if teacher_signed_in?
            if @conversation.teacher.id == current_teacher.id
                @student = @conversation.student
            else
                redirect_to "/"
            end
        elsif student_signed_in?
            if @conversation.student.id == current_student.id
                @teacher = @conversation.teacher
            else
                redirect_to '/'
            end
        end
    end


    def create
        if teacher_signed_in?
            @conversation = Conversation.new(conversation_student_params)
            @conversation.teacher_id = current_teacher.id
        elsif student_signed_in?
            @conversation = Conversation.new
            @conversation.teacher_id = params[:teacher_id]
            @conversation.student_id = current_student.id
        end

        if @conversation.save
            redirect_to :action => "show", :id => @conversation.id
        else
            redirect_to "/"
        end
    end

    private
    def conversation_student_params
        params.require(:conversation).permit(:student_id)
    end

    def conversation_teacher_params
        params.require(:conversation).permit(:teacher_id)
    end



end
