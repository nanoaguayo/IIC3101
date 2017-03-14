class CommentsController < ApplicationController
  def create
    @comment = Comment.new(username: params[:comment][:username], body: params[:comment][:body],new_id: params[:new_id])
    if @comment.save then
      flash.now[:success] = "Comentario agregado"
      redirect_to news_path(params[:new_id])
    else
      flash.now[:danger] = "Error al agregar comentario"
      redirect_to news_path(params[:new_id])
    end
  end

end
