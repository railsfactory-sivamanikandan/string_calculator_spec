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

   it "return value 3 for 1,2,2,1,3" do
    expect("1,2,2,1,3".extend(StringCalculator).manipulate).to eq(9)
   end

   it "return value 10 for 3\n3\n3\n1" do
    expect("3\n3\n3\n1".extend(StringCalculator).manipulate).to eq(10)
   end

   it "return 7 for 1\n4,2" do
    expect("1\n4,2".extend(StringCalculator).manipulate).to eq(7)
   end

   it "return 7 for //;1;4;2" do
    expect("//;\n1;4;2".extend(StringCalculator).manipulate).to eq(7)
   end

   it "raise error for negative number" do
    expect{"-1".extend(StringCalculator).manipulate}.to raise_error
   end

   it "raise error for negative numbers with message for -1,2,-9" do
    expect{"-1,2,-9".extend(StringCalculator).manipulate}.to raise_error('Negativies not allowed:-1,-9')
   end

   it "Number bigger then 1000 should ignored for 1,1001" do
    expect("1,1001".extend(StringCalculator).manipulate).to eq(1)
   end

   it "Number bigger then 1000 should ignored for 1,1001, 2000, 3, 1002, 1" do
    expect("1,1001, 2000, 3, 1002, 1".extend(StringCalculator).manipulate).to eq(5)
   end
   
   it "Allow multiple uniform delimiters like //***\n3***7***1" do
    expect("//***\n3***7***1".extend(StringCalculator).manipulate).to eq(11)
   end

   it "Allow multiple uniform delimiters with negative values like //***\n3***-7***1***-10" do
    expect{"//***\n3***-7***1***-10".extend(StringCalculator).manipulate}.to raise_error('Negativies not allowed:-7,-10')
   end
   
   it "Allow mutiple nonuniform delimiters like ///****\n24;1***;5" do
    expect("///****\n24;1***;5".extend(StringCalculator).manipulate).to eq(30)
   end

   it "Allow mutiple nonuniform delimiters with negative values like ///****\n-24;1***;5" do
    expect{"///****\n-24;1***;5".extend(StringCalculator).manipulate}.to raise_error('Negativies not allowed:-24')
   end

  end
end
