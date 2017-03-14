class AdminController < ApplicationController
  def home
    aux = New.all
    @news = aux.sort_by &:created_at
  end
  def creator
  end

  def create
    @new = New.new(params[:new])

    @new.save
    redirect_to @new
  end
end
