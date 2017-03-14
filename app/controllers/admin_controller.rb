class AdminController < ApplicationController
  def home
    aux = New.all
    @news = aux.sort_by(&:created_at).reverse
    flash.now[:info] = "Noticias cargadas correctamente"
  end
end
