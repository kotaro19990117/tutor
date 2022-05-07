class LikesController < ApplicationController

    def create
        like = current_teacher.likes.create(tweet_student_id: params[:tweet_student_id])
        redirect_back(fallback_location: root_path)
    end

    def destroy 
        like = Like.find_by(tweet_student_id: params[:tweet_student_id], teacher_id: current_teacher.id)
        like.destroy
        redirect_back(fallback_location: root_path)
    end
end
