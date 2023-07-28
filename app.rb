require './book'
require './person'
require './rental'
require './teacher'
require './student'
require './classrom'

class App
  def list_all_books(books)
    books.each do |i|
      puts(" Title: \"#{i.title}\", Author : #{i.author}")
    end
  end

  def list_all_people(people)
    people.each do |i|
      stud = '[Student]'
      if defined?(i.specialization)
        stud = '[Teacher]'
      end
      puts("#{stud} Name: #{i.name}, ID : #{i.id} ,Age : #{i.age}")
    end
  end

  def create_people(age, name, parent_permission, cat, specialization)
    if cat == 1
      classr = Classroom.new('1ere')
      Student.new(classr, age, name, parent_permission)

    else
      Teacher.new(specialization, age, name)

    end
  end

  def create_book(title, author)
    Book.new(title, author)
  end

  def create_rental(date, book, person)
    Rental.new(date, book, person)
  end

  def list_rental(tab, ido)
    tab.each do |i|
      puts " Date : #{i.date}, \"#{i.book.title}\" by  #{i.book.author}" if i.person.id == ido
    end
  end
end
