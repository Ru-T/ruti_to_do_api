class ToDosController < ApplicationController
  before_action :set_to_do, only: [:update, :destroy]

  def index
    @to_dos = ToDo.all
    render json: @to_dos
  end

  def create
    @to_do = ToDo.new(to_do_params)
    if @to_do.save
      render json: @to_do
    else
      render json: @to_do.errors
    end
  end

  def update
    @to_do.update(to_do_params)
    if @to_do.save
      render json: @to_do
    else
      render json: @to_do.errors
    end
  end

  def destroy
    @to_do.destroy
    render json: {}
  end

private

  def set_to_do
    @to_do = ToDo.find(params[:id])
  end

  def to_do_params
    params.require(:to_do).permit(:title, :is_completed)
  end
end
