class NewsController < ApplicationController
  def show
    @new = New.find_by_id(params[:id])
    @comments = []
    @comments = Comment.where(new_id: @new.id)
    puts @new.title
  end
end
