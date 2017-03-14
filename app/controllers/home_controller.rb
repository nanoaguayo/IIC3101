class HomeController < ApplicationController
  def index
    aux = New.GetEditedNews
    @news = aux.first(10)
    @comments_n = Array.new(10)
    index=0
    @news.each do |aux|
      @comments_n[index] = Comment.where(new_id: aux.id).count
      index = index + 1
    end
    flash.now[:info] = "Noticias cargadas correctamente"
  end
end
