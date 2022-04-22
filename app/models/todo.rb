class Todo < ActiveRecord::Base
    def to_pleasant_string
        is_completed = completed ? "[X]" : "[ ]"
        "#{id}. #{due_date.to_formatted_s(:long)} #{todo_text} #{is_completed}"
    end
end