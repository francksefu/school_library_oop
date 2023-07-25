require 'person.rb'

class Student < Person
    def initialize (classroom, age, name = "Unknown", parent_permission = true)
        super(age, name, parent_permission)
        @classroom = classroom
    end

    def play_hooky
        return "¯\(ツ)/¯"
    end
end
