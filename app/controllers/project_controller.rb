class ProjectController < ApplicationController
  def index

    respond_to do |format|
      format.json { render json: {message: 'ok'} }
      format.html { render json: {message: 'ok'} }
    end

  end
end
