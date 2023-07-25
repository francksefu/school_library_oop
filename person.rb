class Person
    def initialize(age, name = "Unknown", parent_permission = true)
        @name = name
        @age = age
        @parent_permission = parent_permission
    end

    def name 
        @name
    end

    def age
        @age
    end

    def id
        @id
    end

    def name=(value)
        @name = value
    end

    def age=(value)
        @age = value
    end

    private
    def of_age?
        if @age >= 18
            return true
        else
            return false
        end
    end

    public
    def can_use_services?
        if @parent_permission == true || @age > 18
            return true
        else 
            return false
        end
    end
end
