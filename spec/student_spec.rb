require '../student'

describe Student do
  context 'Testing the Student class' do
    student = Student.new(22, 'Anuar', parent_permission: true)

    it 'has the class ' do
      expect(student.instance_of?(Student)) == true
    end

    it 'should have the right name, age and permission' do
      expect(student.age).to eq 22
      expect(student.name).to eq 'Anuar'
      expect(student.parent_permission).to eq true
    end
  end
end
