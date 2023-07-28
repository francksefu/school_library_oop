require 'rubygems'
require 'book'
require 'person'
require 'rental'
require 'teacher'
require 'student'

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
            puts(' Name: #{i.name}, ID : #{i.id}, Age : #{i.age}')
        end
    end
    
    def create_person (age, name,parent_permission, cat)
        if (cat == 1)
            student = Student.new('class 1', age, name, parent_permission)
            return student
        else 
            teacher = Teacher.new('teacher', age, name)
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

