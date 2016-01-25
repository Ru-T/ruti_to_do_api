class ToDosController < ApplicationController
  before_action :set_todo, only: [:update, :destroy]

  def index
    @todos = ToDo.all
    render json: { todos: @todos }
  end

  # POST /todos.json
  def create
    @todo = ToDo.new(to_do_params)
    if @todo.save
      render json: { todo: @todo }
    else
      render json: @todo.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /todos/1.json
  def update
    if @todo.update(to_do_params)
      render json: { todo: @todo }
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

  def set_todo
    @to_do = ToDo.find(params[:id])
  end

  def to_do_params
    params.require(:to_do).permit(:title, :is_completed)
  end
end
