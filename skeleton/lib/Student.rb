class Student 
    
    def initialize(student_reg_no,first_Name, last_Name)
      @first_Name = first_Name
      @last_Name = last_Name
      @result = 0
      @student_reg_no = student_reg_no
    end
    
    def student_Ca(ca)
      @ca = ca
      @result += ca 
    end
    
    def student_Ue(ue)
      @ue = ue 
      @result += ue
    end
    
    def update_result(mark)
     @result -= mark
    end
    
    attr_reader :first_Name
    attr_reader :last_Name
    attr_reader :ca
    attr_reader :ue
    attr_reader :result
    attr_reader :student_reg_no
    
    
    
end
