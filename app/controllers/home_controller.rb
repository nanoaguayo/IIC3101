class HomeController < ApplicationController
  def index
    aux = New.all
    @news = aux.sort_by(&:created_at).reverse.first(10)
    flash.now[:info] = "Noticias cargadas correctamente"
  end
end
