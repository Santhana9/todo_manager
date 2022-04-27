class TodosController < ApplicationController
    skip_before_action :verify_authenticity_token

    def index
        render "index"
        #render plain: Todo.all.map{|todo| todo.to_pleasant_string}.join("\n")#Hello To Rails!! #{DateTime.now.to_s}"
    end

    def show
        id = params[:id]
        # render plain: "The id is #{id}"
        todo = Todo.find(id)
        render plain: todo.to_pleasant_string
    end

    def create
        todo_text = params[:todo_text]
        due_date = DateTime.parse(params[:due_date])
        #completed = params[:completed]
        new_todo = Todo.create!(
            todo_text: todo_text,
            due_date: due_date,
            completed: false,
        )
        # render plain: "New Todo created!! #{new_todo.id}"
        redirect_to todos_path
    end

    def update
        id = params[:id]
        completed = params[:completed]
        todo = Todo.find(id)
        todo.completed = completed
        todo.save!
        #render plain: "#{todo.todo_text} is updated"
        redirect_to todos_path
    end
end