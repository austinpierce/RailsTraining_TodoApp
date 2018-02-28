class TodosController < ApplicationController
 
  def new
    @todo = Todo.new # this @todo is used in the view, initialize here
                     # Todo is capitalized because it's a class
  end
  
  def create
    @todo = Todo.new(todo_params) # instance variable
    if @todo.save # save to DB
    redirect_to todo_path(@todo)   
    else
      render 'new'
    end
  end
  
  private # private means only available to this controller
    def todo_params
      params.require(:todo).permit(:name, :description) #white listing
    end
  
end