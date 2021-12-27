class TodosController < ApplicationController
  before_action:find_todo,only: [:show,:edit,:update,:destroy]
  def index
  	@todos =Todo.all
  end
  def new
  	@todo = Todo.new
  end
  
  def create
    @todo = Todo.new(todo_params)

  	if @todo.save
  	 redirect_to @todo
   else
      render 'new',status: :unprocessable_entity
   end
  end
  def show
  	@todo = Todo.find(params[:id])
  end
  def edit
  	@todo = Todo.find(params[:id])
  end
  def update
    @todo = Todo.find(params[:id]) 
    if @todo.update(todo_params) 
      redirect_to @todo    
   else 
      render'edit',status: :unprocessable_entity
   end
 end
  def destroy
    @todo.destroy
   	redirect_to root_path
 end
   
  def find_todo
    @todo = Todo.find(params[:id])
  end  
 private
  def todo_params
   	params.require(:todo).permit(:task,:completed)
  end
end