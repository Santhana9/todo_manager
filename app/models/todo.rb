class Todo < ActiveRecord::Base
    belongs_to :user
    def to_pleasant_string
        is_completed = completed ? "[X]" : "[ ]"
        "#{id}. #{due_date.to_formatted_s(:long)} #{todo_text} #{is_completed}"
    end
    def due_today?
        due_date == Date.today
    end

    def self.of_user(user)
        all.where(user_id: user.id)
    end

    def self.overdue
        all.where("due_date < ?", Date.today)
    end
    
    def self.due_today
        all.where("due_date = ?", Date.today)
    end

    def self.due_later
        all.where("due_date > ?", Date.today)
    end

    def self.add_task(h)
        Todo.create!(
            todo_text: h[:todo_text],
            due_date: Date.today + h[:due_in_days],
            completed: false,
        )
    end

    def self.show_list
        puts "My Todo-list\n\n"
        puts "Overdue \n"
        puts overdue.show_list
        puts "\n\n"

        puts "Due Today\n"
        puts due_today.show_list
        puts"\n\n"

        puts "Due_Later\n"
        puts due_later.show_list
        puts "\n\n"
    end

    def self.completed
        all.where(completed: true)
    end

    def self.mark_as_completed(id)
        todo = find(id)
        todo.completed = true
        todo.save!
        todo
    end

end