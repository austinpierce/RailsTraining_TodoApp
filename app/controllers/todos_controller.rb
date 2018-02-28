class TodosController < ApplicationController
 
  def new
    @todo = Todo.new # this @todo is used in the view, initialize here
                     # Todo is capitalized because it's a class
  end
  
  def create
    @todo = Todo.new(todo_params) # instance variable
  end
  
  private # private means only available to this controller
  
end