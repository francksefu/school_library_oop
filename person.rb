class Person
    def initialize(age, name = "Unknown", parent_permission = false)
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
      @age >= 18
    end
  
    public
    def can_use_services?
      @parent_permission || @age >= 18
    end
  end
  