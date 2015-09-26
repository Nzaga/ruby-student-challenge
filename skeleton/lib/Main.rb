require './Student.rb'
class Register

    @@students = []
    
    def initialiaze()
      
    end

    attr_reader :students
    attr_reader :no
    
    def validate_input(marks)
        begin
            return Float(marks)
        rescue
            return -1;
       
        end
    end
    
    def get_ca(student)
      puts "","Enter Course assessment marks for #{student.first_Name} #{student.last_Name}"
      print "CA : "
      ca = $stdin.gets.chomp
      ca = validate_input(ca)
      
      if ca >= 0 && ca <= 40
        student.student_Ca(ca)
      else
        puts "","You have entered the wrong mark should be greater or equal to zero and less or equal to 40",""
        get_ca(student)
      end
    end
    
    def get_ue(student)
     
     puts "","Enter UE marks for #{student.first_Name} #{student.last_Name}"
     print "UE : "
     ue = $stdin.gets.chomp
     ue = validate_input(ue)
     
     if ue >= 0 && ue <= 60
      student.student_Ue(ue)
     else
       puts "","You have entered the wrong marks should be greater or equal to zero and less or equla to 60",""
       get_ue(student)
     end
    
    end
    
    
    
    def student_register()
        print "-" * 10, "STUDENT REGISTER", "-" * 10
        puts ""
        
        puts "","Enter student first name"
        print "First name : "
        first_name = $stdin.gets.chomp
        
        puts "","Enter student last name"
        print "Last name : "
        last_name = $stdin.gets.chomp
        
        student = Student.new(first_name,last_name)
        
        get_ca(student)
        get_ue(student)
                
        @@students.push(student)
        
        start
        
    end

    def progress(option)
      
      if option == "1"
        student_register()
      elsif option == "2"
       if @@students.length == 0
         puts " ","No students : Register students first "," "
         start
       else
        puts "Students Results"," "
        count = 1
        puts "NO\tNAME\t\tCA\tUE\tTOTAL"
        @@students.each do |student|
          puts "#{count}\t#{student.first_Name}\t#{student.last_Name}\t#{student.ca}\t#{student.ue}\t#{student.result}"
          count += 1
        end
        
       end
      elsif option == "3"
        puts "Bye bye"
        exit(1)
      else
        puts "Wrong selection"," "
        start
      end
    end 

    def start()
      prompt = ">> "
      puts "","What do you want to do"
      puts "  1. Enter students results"
      puts "  2. View students results"
      puts "  3. Quit the system"," "

      puts "","Enter your selection" 
      print prompt
      selection = $stdin.gets.chomp
      progress(selection)
    end

    def system_begin()
     puts ""
     print "*" * 20 
     print " WELCOME TO STUDENTS ACADEMICS "
     puts "*" * 20," "
     
     start
    end

end

mySystem = Register.new()
mySystem.system_begin

