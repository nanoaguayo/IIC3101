class UsuariosController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    @usuarios = Usuario.all
  end

  def show
    @usuario = Usuario.find_by_id(params[:id])
    if @usuario then

    else
      render status: 404, json: {
          error: "Usuario no encontrado"
      }.to_json
    end
  end

  def edit
    @usuario = Usuario.find_by_id(params[:uid])
    if !@usuario then
      render status:404, json:{
        error: 'Usuario no encontrado'
      }
    elsif params[:id] then
      render status:400, json:{
        error: 'id no es modificable'
      }
    elsif @usuario.update_attributes(usuario_params)
      render :show
    else
      render status:500,json:{
        error: 'La modificacion ha fallado'
      }
    end
  end

  def delete
    @usuario = Usuario.find_by_id(params[:id])
    if @usuario then
      @usuario.delete
      render status:204
    else
      render status: 404, json: {
          error: "Usuario no encontrado"
      }.to_json
    end
  end

  def create
      if params[:id] then
        render status:400, json:{
          error: 'No se puede crear usuario con id'
        }.to_json
      else
        @user = Usuario.create(usuario_params)
        if @user.save then
          @usuario = @user
          render :show
        else
          render status: 500, json:{
            error: 'La creacion ha fallado'
          }.to_json
        end
      end
  end
  def usuario_params
    params.permit(:apellido, :twitter,:usuario,:nombre)
  end
end
