require "rspec"
require_relative "../lib/interpreter.rb"

describe Interpreter do
  it "stores value literals in variables" do
    i = Interpreter.new
    i.evaluate([:define, :x, 3])
    expect(i.evaluate([:x])).to eql(3)
  end
end
