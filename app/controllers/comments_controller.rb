class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_event, only: [:create]
  before_action :find_comment, only: [:destroy]
  
  def create
    @comment = @event.comments.new(comment_params)
    if @comment.save
      @content = comment_params[:content]
      redirect_to @event
    else
      redirect_to "/"
    end
  end

  def destroy
    @comment.destroy
  end

  private
  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id)
  end

  def find_event
    @event = Event.find(params[:event_id])
  end

  def find_comment
    @comment = current_user.comments.find(params[:id])
  end
end
