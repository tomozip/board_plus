class CommentsController < ApplicationController

  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  def create
    @my_thread = MyThread.find(params[:my_thread_id])
    @comment = @my_thread.comments.create(comment_params)
    redirect_to my_thread_path(params[:my_thread_id])
  end

  def edit
  end

  def destroy
    @comment.destroy
    redirect_to my_thread_path(@comment.my_thread_id)
  end

  def update
    if @comment.update(comment_params)
      redirect_to my_thread_path(@comment.my_thread_id)
    else
      render 'show'
    end
  end

  private
    def comment_params
      params[:comment].permit(:user_id, :body)
    end

    def set_comment
      @comment = Comment.find(params[:id])
    end

end
