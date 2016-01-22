class ToDosController < ApplicationController

  def index
    render json: ToDo.all
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
    @todo.destroy
      head :no_content
  end


private

  def to_do_params
    params.require(:to_do).permit(:title, :is_completed)
  end

end
