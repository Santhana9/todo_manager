class TodosController < ApplicationController
    def index
        render plain: Todo.all.map{|todo| todo.to_pleasant_string}.join("\n")#Hello To Rails!! #{DateTime.now.to_s}"
    end

    def show
        id = params[:id]
        # render plain: "The id is #{id}"
        todo = Todo.find(id)
        render plain: todo.to_pleasant_string
    end
end