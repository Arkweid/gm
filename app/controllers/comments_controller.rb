class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :load_commentable, only: [:create]
  before_action :load_comment, except: [:create]
  after_action :publish_comment, only: [:create]

  def create
    @comment = @commentable.comments.create(comment_params)
  end

  def update
    @comment.update(comment_params)
  end

  def destroy
    @comment.destroy
  end

  private

  def load_commentable
    @commentable = commentable_type.classify.constantize.find(params["#{commentable_type}_id"])
  end

  def commentable_type
    params[:commentable_type]
  end

  def load_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content, :privacy).merge(user: current_user)
  end
end