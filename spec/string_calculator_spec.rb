require_relative "../string_calculator"
describe StringCalculator do
  context "#manipulate" do
   it "return 0 for empty string" do
    expect("".extend(StringCalculator).manipulate).to eq(0)
   end
  end
end
