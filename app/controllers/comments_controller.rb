class CommentsController < ApplicationController
    def create
        @comment = current_user.comments.build(comment_params)
        @comment.blog_id = params[:blog_id]
        if @comment.save
        #
        else
        puts ">>>>>>>>>>>>#{@comment.errors.full_messages.join(',')}" 
        end
    end
    

    private

    def comment_params
        params.require(:comment).permit(:content)
    end
end
