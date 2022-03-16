require '../person'
require '../nameable'

describe Person do
  context "Testing the Person class" do
    
    person = Person.new(23, "Adam", parent_permission: true)

    it "has the class Person" do
      expect(person.instance_of?(Person)) == true
    end

    it "should have the right name, age and permission" do
      expect(person.age) == 23
      expect(person.name) == "Adam"
      expect(person.parent_permission) == true
    end
  end
end
