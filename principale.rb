class Nameable
    def correct_name
      raise NotImplementedError
    end
end

class Person < Nameable
  attr_accessor :name, :age
  attr_reader :id, :rental

  def initialize(age, name = 'Unknown', parent_permission= true)
    super()
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rental = []
    @id = Random.rand(1..1000)
  end

  def correct_name
    @name
  end

  private

  def of_age?
    @age >= 18
  end

  public

  def can_use_services?
    @parent_permission || of_age?
  end
end


class Student < Person
  attr_accessor :classroom

  def initialize(age, name = 'Unknown', parent_permission= true)
    super(age, name, parent_permission)
    #@classroom = classroom
  end

  def play_hooky
    '¯(ツ)/¯'
  end

  #def classroom=(classroom)
   # @classroom = classroom
   # classroom.students.push(self) unless classroom.students.include?(self)
  #end
end

stud = Student.new(2, 'fr', true)
puts stud.name