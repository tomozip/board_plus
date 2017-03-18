class MyThreadsController < ApplicationController

  before_action :set_my_thread, only: [:show, :edit, :update, :destroy]

  def index
    @my_threads = MyThread.all
  end

  def create
    @my_thread = MyThread.create(my_thread_params)
    redirect_to my_threads_path
  end

  def show
  end

  def edit
  end

  def update
    if @my_thread.update(my_thread_params)
      redirect_to my_threads_path
    else
      render 'edit'
    end
  end

  def destroy
    @my_thread.destroy
    redirect_to my_threads_path
  end

  private
    def my_thread_params
      params.require(:my_thread).permit(:user_id, :title, :body)
    end

    def set_my_thread
      @my_thread = MyThread.find(params[:id])
    end

end
