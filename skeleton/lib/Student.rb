class Student 
    
    def initialize(first_Name, last_Name)
      @first_Name = first_Name
      @last_Name = last_Name
      @result = 0
    end
    
    def student_Ca(ca)
      @ca = ca
      @result += ca 
    end
    
    def student_Ue(ue)
      @ue = ue 
      @result += ue
    end
    
    attr_reader :first_Name
    attr_reader :last_Name
    attr_reader :ca
    attr_reader :ue
    attr_reader :result
    
    
    
end
