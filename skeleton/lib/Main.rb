require './Student.rb'
class Register

    attr_reader :students
    attr_reader :no
    
    @@students = []
    
    def initialiaze()   
    end
    
    def update_student(student, index)
      puts "","What do you what to do with #{student.first_Name} #{student.last_Name}"
      puts "  1. Edit CA marks"
      puts "  2. Edit UE marks"
      puts "  3. Return main menu"
      
      print " >> "
      choice = $stdin.gets.chomp
      
      if choice == "1"
        get_ca(student, "edit", index)
        update_student(student, index)
      elsif choice == "2"
        get_ue(student, "edit", index)
        update_student(student, index)
      elsif choice == "3"
        start
      else 
        puts "Wrong choice repeat again"
        update_student(student)
      end
    end 
    
    def get_student_to_edit(reg_no)
     if /\b\d{4}\b/.match(reg_no)
        index = 0
        @@students.each do | student |
          if student.student_reg_no == reg_no
            return student,index 
            break
          else
           index += 1
          end
        end
     else
       puts "Invalid registration number"
       get_student_reg_no()
     end
    end 
     
    def add_other_student()
     puts "","Do you what to add other student? (YES/NO)"
     answer = $stdin.gets.chomp.upcase!
     
     if answer == 'YES'
       student_register
       
     elsif answer == 'NO'
        puts ""
     else 
       puts "","You have entered a wrong choice",""
       add_other_student
     end
     
    end
    
      
    def validate_input(marks)
        begin
            return Float(marks)
        rescue
            return -1;
       
        end
    end
    
    def get_ca(student, state, index)
      puts "","Enter Course assessment marks for #{student.first_Name} #{student.last_Name}"
      print "CA : "
      ca = $stdin.gets.chomp
      ca = validate_input(ca)
      
      if ca >= 0 && ca <= 40
        if state == 'new'
          student.student_Ca(ca)
        else
          student.update_result(student.ca)
          student.student_Ca(ca)
          @@students[index] = student
        end
      else
        puts "","You have entered the wrong mark should be greater or equal to zero and less or equal to 40",""
        get_ca(student)
      end
    end
    
    def get_ue(student, state, index)
     
     puts "","Enter UE marks for #{student.first_Name} #{student.last_Name}"
     print "UE : "
     ue = $stdin.gets.chomp
     ue = validate_input(ue)
     
     if ue >= 0 && ue <= 60
      if state == 'new'
        student.student_Ue(ue)
        @@students.push(student)
        add_other_student
      else
         student.update_result(student.ue)
         student.student_Ue(ue)
         @@students[index] = student
      end
     else
       puts "","You have entered the wrong marks should be greater or equal to zero and less or equla to 60",""
       get_ue(student)
       
     end
    
    end
    
    def check_if_reg_no_exist(reg_no)
     existance = false
     @@students.each do | student |
      if student.student_reg_no == reg_no
       existance = true
      end
     end
     return existance
    end
    
    def validate_reg_no(reg_no)
      if /\b\d{4}\b/.match(reg_no)
        unless check_if_reg_no_exist(reg_no)
         return reg_no
        else
         puts "Registration number exists: Dublication is not allowed"
         get_student_reg_no()
        end
      else
        puts "","Invilid registration number, try again",""
        get_student_reg_no()
      end
    end
    
    def get_student_reg_no()
     puts "","-----"
     puts "Rules: 4 digits only for registration number"
     puts "-----"
     puts "","Enter student registration number"
     print "Registation no: "
     student_reg = $stdin.gets.chomp
     validate_reg_no(student_reg)
    end
    
    def student_register()
        print "-" * 10, "STUDENT REGISTER", "-" * 10
        puts ""
       
        student_reg_no = get_student_reg_no  
        
        puts "","Enter student first name"
        print "First name : "
        first_name = $stdin.gets.chomp
        
        puts "","Enter student last name"
        print "Last name : "
        last_name = $stdin.gets.chomp
        
        student = Student.new(student_reg_no,first_name,last_name)
        
        get_ca(student, "new", -1)
        get_ue(student, "new", -1)
        
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
        puts "#\tREG NO\tNAME\t\tCA\tUE\tTOTAL"
        @@students.each do |student|
          puts "#{count}\t#{student.student_reg_no}\t#{student.first_Name}\t#{student.last_Name}\t#{student.ca}\t#{student.ue}\t#{student.result}"
          count += 1
        end
         start  
       end
       
      elsif option == "3"
        if @@students.length == 0
          puts "","No students : Register students first"," "
          start
        else
          puts "Provide student it"
          print "Student ID : "
          student_id = $stdin.gets.chomp
          student, index = get_student_to_edit(student_id)
          update_student(student, index)
        end
        
      elsif option == "4"
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
      puts "  3. Edit student results"
      puts "  4. Quit the system"," "

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

