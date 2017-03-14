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
    @new = New.new(new_params)
    if @new.save then
      @comments = Comment.where(new_id: @new.id)
      flash.now[:success] = "Noticia creada correctamente"
      render 'show'
    else
      flash.now[:danger] = "No se ha podido crear la noticia"
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
      flash.now[:success] = "Noticia editada correctamente"
      render 'show'
    else
      flash.now[:danger] = "No se ha podido editar"
      render 'edit'
    end
  end

  def destroy
    Comment.where(new_id: params[:id]).destroy_all
    @new = New.find(params[:id])
    @new.delete
    flash.now[:success] = "Eliminada correctamente"
    redirect_to admin_path
  end

  private

  def new_params
    params.require(:new).permit(:title, :descent, :body)
  end
end
