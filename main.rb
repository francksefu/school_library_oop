class Nameable
    def correct_name
      raise NotImplementedError
    end
end

class Classroom
  attr_accessor :label
  attr_reader :students

  def initialize(label)
    @label = label
    @students = []
  end

  def add_student(student)
    @students.push(student)
    student.classroom = self
  end
end

class Person < Nameable
    attr_accessor :name, :age
    attr_reader :id, :rental
  
    def initialize(age, name = 'Unknown', parent_permission: true)
      super()
      @name = name
      @age = age
      @parent_permission = parent_permission
      @rental = []
      @id = Random.ran(1..1000)
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
    attr_reader :classroom
  
    def initialize(classroom, age, name = 'Unknown', parent_permission: true)
      super(age, name, parent_permission)
      @classroom = classroom
    end
  
    def play_hooky
      '¯(ツ)/¯'
    end
  
    def classroom=(classroom)
      @classroom = classroom
      classroom.students.push(self) unless classroom.students.include?(self)
    end
  end
  
  class Teacher
    def initialize(specialization, age, name = 'Unknown', parent_permission: true)
      super(age, name, parent_permission)
      @specialization = specialization
    end
  
    def can_use_services?
      true
    end
  end

  class Book
    attr_accessor :title, :author, :rental
  
    def initialize(title, author)
      @title = title
      @author = author
      @rental = []
    end
  
    def add_rental(person, date)
      Rental.new(date, self, person)
    end
  end

  class Rental
    attr_accessor :date, :book, :person
  
    def initialize(date, book, person)
      @date = date
  
      @book = book
      book.rental << self
  
      @person = person
      person.rental << self
    end
  end

class App 
    def initialize()
    end

    def list_all_books(books)
        books.each do |i|
            puts(' Title: \"#{i.title}\", Author : \"#{i.author}\"')
        end
    end
    
    def list_all_people(people)
        people.each do |i|
            puts "ok"
        end
    end
    
    def create_person (age, name,parent_permission, cat)
        if (cat == 1)
          classr = Classroom.new("1ere")
          student = Student.new( classr,age, name, parent_permission)
          return student
        else 
            teacher = Teacher.new('teacher', age, name, true)
            return teacher
        end
    end
    
    def create_book (title, author)
        book = Book.new(title, author)
        return book
    end
    
    def create_rental (date, book, person)
        rental = Rental.new(date, book, person)
        return rental
    end
    
    def list_rental (tab, ido)
        tab.each do |i|
            if(tab[i].person.id == ido)
                return '\"#{tab[i].book.title} by  #{tab[i].book.author}\"'
            end
        end
    end    
end

def command 
    puts "Please  choose an option by enterin a number : "
    puts ""
    puts "1- List all books"
    puts "2- List all people"
    puts "3- Create a person"
    puts "4- Create a book"
    puts "5- Create a rental "
    puts "6- List all rentals for a given person id"
    puts "7- Exits"
end

def main

    book_table = []
    person_table = []
    rental_table = []

    app = App.new()

    inp = 20
    puts "Welcome to schoom Library App!"
    puts ""
    while (inp != "7")
        command()
        inp = gets.chomp
        if (inp == "1")
            if book_table.length != 0
                app.list_all_books(book_table)
            else
                puts "No book in library"
            end
        end

        if (inp == "2")
            if person_table.length != 0
                app.list_all_people(person_table)
            else
                puts "No person"
            end
        end

        if (inp == "3")
            print "Do you want to create a student (1) or a teacher(2) ?[Input the number] "
            num = gets.chomp
            if (num == "1" || num == "2")
                print " Age : "
                age =  gets.chomp
                puts ""
                print "Name : "
                name =  gets.chomp
                if num == "1"
                    puts""
                    print "Has parent permission ? [Y/N] : "
                    permission =  gets.chomp
                    perm = true if (permission == "y" || permission == "Y")
                    perm = false if (permission == "n" || permission == "N")
                    student = (app.create_person(age, name, perm, 1))
                    #person_table.push(student)
                    puts student.name
                end
                if num == "2"
                    teacher = (app.create_person(age, name, "", 2))
                    person_table.push(teacher)
                end
                puts "Person created successfully"
            end

        end

    end
end

main()