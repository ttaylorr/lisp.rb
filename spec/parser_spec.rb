require "rspec"
require_relative '../lib/parser.rb'

describe Parser do
  before do
    @p = Parser.new
  end

  it "chunks pieces of lisp code into tokens" do
    expect(@p.tokenize('(define x 3)')).to eql(['(', 'define', 'x', '3', ')'])
  end
end
