class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    #redirect_to "/prototype/#{comment.prototype.id}"

    # 下記の書き方でもいいのかな？takako
     if @comment.save
       redirect_to prototype_path(@comment.prototype)
     else
       @prototype = @comment.prototype
       @comments = @prototype.comments 
       render  "prototypes/show"
     end
  end

  def show
    @comments = Comment.new
    
  end
  
  private
  def comment_params
   params.require(:comment).permit(:content).merge(user_id: current_user.id, Prototype_id: params[:prototype_id])
  end

end
