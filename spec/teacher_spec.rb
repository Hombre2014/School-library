require '../teacher'

describe Teacher do
  context "Testing the Teacher class" do
    
    teacher = Teacher.new(43, "Bob", 'Math', parent_permission: true)

    it "has the class " do
      expect(teacher.instance_of?(Teacher)) == true
    end

    it "should have the right name, age and permission" do
      expect(teacher.age) == 43
      expect(teacher.name) == "Bob"
      expect(teacher.specialization) == "Math"
      expect(teacher.parent_permission) == true
    end

    it "should be able to use services" do
      expect(teacher.can_use_services?) == true
    end
  end
end
