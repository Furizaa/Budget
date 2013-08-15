class PositionsController < ApplicationController
  
  before_filter :get_position, only: [:show, :destroy, :update]

  def index
    positions = Position.all ||= []
    render json: positions, root: false
  end

  def show
    render json: @position
  end

  def create
    position = Position.new title: params[:title], amount: params[:amount]
    position.save!

    render json: true
  end

  def destroy
    @position.destroy!

    render json: true
  end

  def update
    @position.title = params[:title]
    @position.amount = params[:amount]
    @position.save!

    render json: true 
  end

  private

  def get_position
    @position = Position.find(params[:id]) || not_found
  end

end
