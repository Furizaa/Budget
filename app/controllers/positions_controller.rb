class PositionsController < ApplicationController
  
  def index
    positions = Position.all ||= []
    render json: positions, root: false
  end

  def show
    position = Position.find params[:id] ||= {}
    render json: position
  end

  def create
  end

  def destroy
  end

  def update
  end
end
