class TodosController < ApplicationController
  before_action :set_todo, only: [:edit, :update, :show, :destroy]
  # sets todo in private method so you don't repeat code in each method
  
  def new
    @todo = Todo.new # this @todo is used in the view, initialize here
                     # Todo is capitalized because it's a class
  end
  
  def create
    @todo = Todo.new(todo_params) # instance variable
    if @todo.save # save to DB
      flash[:notice] = "Todo was created successfully!" # flash
    redirect_to todo_path(@todo)   
    else
      render 'new'
    end
  end
  
  def show # action
  end
  
  def edit
  end
  
  def update
    if @todo.update(todo_params)
      flash[:notice] = "Todo was successfully updated"
      redirect_to todo_path(@todo)
     else
      render 'edit'
    end
  end
   
   def index
    @todos = Todo.all # can be named anything (pizza), used plural here because it's multiple
   end
  
  def destroy
    @todo.destroy
    flash[:notice] = "Todo was deleted successfully"
    redirect_to todos_path
  end
  
  
  private # private means only available to this controller
    
    def set_todo
      @todo = Todo.find(params[:id])
    end
  
    def todo_params
      params.require(:todo).permit(:name, :description) #white listing
    end
  
end