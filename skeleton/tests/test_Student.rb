require "./lib/Student.rb"
require "test/unit"

class TestNAME < Test::Unit::TestCase
 
  def test_Student()
    student = Student.new("Amos","Nzaga")
    assert_equal(student.first_Name, "Amos")
    assert_equal(student.last_Name, "Nzaga")
    
    student.student_Ca(30)
    student.student_Ue(50)
    assert_equal(student.result, 80)
  end

end
