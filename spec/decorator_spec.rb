require '../decorator'
require '../nameable'

describe Decorator do
  context "Testing the Decorator class" do
    decorator = Decorator.new('anuar')
    
    it "should have a class of Decorator" do
      expect(decorator.instance_of?(Decorator)) == true
    end
  end
end