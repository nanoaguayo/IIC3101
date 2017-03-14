class NewsController < ApplicationController
  def show
    @new = New.find_by_id(params[:id])
    @comments = []
    @comments = Comment.where(new_id: @new.id)
  end

  def new
    @new = New.new
  end

  def create
    puts 'creating'
    @new = New.new(user_params)
    if @new.save
      # Handle a successful save.
      @comments = Comment.where(new_id: @new.id)
      puts @new.id
      #render 'show'
      render root
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

  def delete
    render show
  end

  private

  def new_params
    params.require(:new).permit(:title, :descent, :body)
  end
end
