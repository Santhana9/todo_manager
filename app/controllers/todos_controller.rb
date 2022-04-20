class TodosController < ApplicationController
    def index
        render plain: Todo.all.to_a#"Hello To Rails!! #{DateTime.now.to_s}"
    end
end