class ToDosController < ApplicationController
  before_action :set_to_do, only: [:show, :edit, :update, :destroy]

  def index
    render json: ToDo.all
  end

  # GET /todos/1.json
  def show
    render json: @to_do
  end

  # POST /todos.json
  def create
    @to_do = ToDo.new(to_do_params)
    if @to_do.save
      render :show, status: :created, location: @todo
    else
      render json: @todo.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /todos/1.json
  def update
    if @to_do.update(to_do_params)
      render :show, status: :ok, location: @todo
    else
      render json: @example.errors, status: :unprocessable_entity
    end
  end

  # DELETE /todos/1.json
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
