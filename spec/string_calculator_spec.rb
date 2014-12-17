require_relative "../string_calculator"
describe StringCalculator do
  context "#manipulate" do
   it "return 0 for empty string" do
    expect("".extend(StringCalculator).manipulate).to eq(0)
   end

   it "return value 1 for 1" do
    expect("1".extend(StringCalculator).manipulate).to eq(1)
   end
   
   it "return value 3 for 1,2" do
    expect("1,2".extend(StringCalculator).manipulate).to eq(3)
   end

  end
end
