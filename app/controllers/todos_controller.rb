class TodosController < ApplicationController
    def index
        render plain: "Hello To Rails!! #{DateTime.now.to_s}"
    end
end