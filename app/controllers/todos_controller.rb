class TodosController < ApplicationController
 
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
    @todo = Todo.find(params[:id])
  end
  
  def edit
    @todo = Todo.find(params[:id])
  end
  
  def update
    @todo = Todo.find(params[:id])
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
  
  private # private means only available to this controller
    def todo_params
      params.require(:todo).permit(:name, :description) #white listing
    end
  
end