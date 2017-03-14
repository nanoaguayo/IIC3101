class HomeController < ApplicationController
  def index
    aux = New.all
    @news = aux.sort_by &:created_at
  end
end
