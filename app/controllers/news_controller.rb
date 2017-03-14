class NewsController < ApplicationController
  def show
    @new = New.find_by_id(params[:id])
    @comments = []
    @comments = Comment.where(new_id: @new.id)
  end

  def new
    puts 'new new new'
    @new = New.new
  end

  def create
    puts 'creating'
    @new = New.new(new_params)
    if @new.save then
      @comments = Comment.where(new_id: @new.id)
      render 'show'
    else
      render 'new'
    end
  end

  def edit
    @new = New.find_by_id(params[:id])
  end

  def update
    @new = New.find(params[:id])
    if @new.update_attributes(new_params)
      # Handle a successful update.
      @comments = Comment.where(new_id: @new.id)
      render 'show'
    else
      render 'edit'
    end
  end

  def destroy
    @new = New.find(params[:id])
    @new.delete
    redirect_to admin_path
  end

  private

  def new_params
    params.require(:new).permit(:title, :descent, :body)
  end
end
