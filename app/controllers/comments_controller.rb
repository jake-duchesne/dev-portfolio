class CommentsController < ApplicationController
  before_action :set_comment, only: [:destroy]
  access user: [:new, :create], site_admin: :allS
  
  def new
    @comment = Comment.new
  end
  
  def create
    @comment = Comment.create(comment_params)
    if @comment.save
      ActionCable.server.broadcast "blogs_channel",
                                    content: @comment.content
    end
  end

  def destroy
    @comment.destroy
    redirect_to request.referrer || root_url
  end
  
  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
