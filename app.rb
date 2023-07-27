require 'book'
require 'person'
require 'rental'
require 'teacher'

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
    else 
        teacher = Teacher.new('teacher', age, name)
    end
end

