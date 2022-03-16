require '../classroom'

describe Classroom do
  context 'Testing the Classroom class' do
    classroom = Classroom.new('MATH101')

    it 'should have a correct label' do
      expect(classroom.label) == 'MATH101'
    end

    it "shouldn't have students initially" do
      expect(classroom.students.size).zero?
    end
  end
end
