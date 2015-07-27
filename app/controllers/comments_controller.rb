class CommentsController < ApplicationController

  def show
    @resource = Resource.find(params[:id])
    @comments = @resource.comments
  end

  def new
    @resource = Resource.find(params[:resource])
    @comment = Comment.new
  end

  def create
   @resource = Resource.find_by(id: params[:resource])
   @comment = @resource.comments.build(comment_params)
    if @comment.save
      flash[:success] = "Comment created!"
      redirect_to show(@resource)
    else
      render 'new'
    end
  end

  private
  
    def comment_params
      params.require(:comment).permit(:content)
    end
  
end
