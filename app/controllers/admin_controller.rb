class AdminController < ApplicationController
  def home
    @news = New.GetEditedNews
    @comments_n = Array.new(@news.count)
    index = 0
    @news.each do |aux|
      @comments_n[index] = Comment.where(new_id:aux.id).count
      index = index + 1
    end
    flash.now[:info] = "Noticias cargadas correctamente"
  end
end
