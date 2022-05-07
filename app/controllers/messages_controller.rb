class MessagesController < ApplicationController
    def create
        @conversation = Conversation.find(params[:conversation_id])
        @message = Message.new(body: params[:body])

        if teacher_signed_in?
            @message.is_teacher = true
        elsif student_signed_in?
            @message.is_teacher = false
        end

        @message.conversation_id = params[:conversation_id]
        @message.student_id = @conversation.student_id
        @message.teacher_id = @conversation.teacher_id

        if @message.save
            redirect_to conversation_path(params[:conversation_id])
        else
            redirect_to conversation_path(params[:conversation_id])
        end

    end

    # private
    # def message_params
    #     params.require(:message).permit(:body, :conversation_id)
    # end
end
