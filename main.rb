require 'app'

def command
  puts 'Please  choose an option by enterin a number : '
  puts ''
  puts '1- List all books'
  puts '2- List all people'
  puts '3- Create a person'
  puts '4- Create a book'
  puts '5- Create a rental '
  puts '6- List all rentals for a given person id'
  puts '7- Exits'
end

def block(inp, person_table, app)
  return unless inp == '3'

  print 'Do you want to create a student (1) or a teacher(2) ?[Input the number] '
  num = gets.chomp
  return unless %w[1 2].include?(num)

  print ' Age : '
  age = gets.chomp
  print 'Name : '
  name = gets.chomp
  if num == '1'
    print 'Has parent permission ? [Y/N] : '
    permission = gets.chomp
    perm = true if %w[y Y].include?(permission)
    perm = false if %w[n N].include?(permission)
    student = app.create_people(age, name, perm, 1, '')
    person_table.push(student)
  end
  if num == '2'
    print 'Specialization : '
    specialization = gets.chomp
    teacher = app.create_people(age, name, '', 2, specialization)
    person_table.push(teacher)
  end
  puts 'Person created successfully'
end

def looping(inp, person_table, book_table, app)
  while inp != '7'
    command
    inp = gets.chomp
    if inp == '1'
      if book_table.empty?
        puts 'No book in library'
      else
        app.list_all_books(book_table)
      end
    end

    if inp == '2'
      if person_table.empty?
        puts 'No person'
      else
        app.list_all_people(person_table)
      end
    end

    block(inp, person_table, app)

    if inp == '4'
      print 'Title : '
      title = gets.chomp
      print 'Author : '
      author = gets.chomp
      book_table << app.create_book(title, author)
      puts 'Book created successfully'
    end

    if inp == '6'
      print 'ID of person : '
      index = gets.chomp
      index = index.to_i
      app.list_rental(rental_table, index)
    end

    app.list_all_books(book_table) if inp == '1' && (book_table != 0)

    next unless inp == '5'

    puts 'Select a book from the following list by number'
    index_b = 0
    next unless book_table != 0

    book_table.each_with_index do |i, idx|
      puts "#{idx}) Title : \"#{i.title}\", Author : #{i.author}"
    end
    index = gets.chomp
    index_b = index.to_i
    index_p = 0
    puts 'Select a person from the following list by number (not id)'
    next unless person_table != 0

    person_table.each_with_index do |i, idx|
      stud = '[Student]'
      if defined?(i.specialization)
        stud = '[Teacher]'
      end
      puts("#{idx})  #{stud} Name: #{i.name}, ID : #{i.id} ,Age : #{i.age}")
    end
    index = gets.chomp
    index_p = index.to_i
    print 'Date : '
    day = gets.chomp
    rental_table << app.create_rental(day, book_table[index_b], person_table[index_p])
    puts 'Rentals created successfully'
  end
end

def main
  book_table = []
  person_table = []
  rental_table = []
  app = App.new
  inp = 20
  puts 'Welcome to schoom Library App!'
  puts ''
  looping(inp, person_table, book_table, app)
  puts 'Thank you for use this app!'
end

main
