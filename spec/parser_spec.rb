require "rspec"
require_relative '../lib/parser.rb'

describe Parser do
  before do
    @p = Parser.new
  end

  it "chunks pieces of lisp code into tokens" do
    expect(@p.tokenize('(define x 3)')).to eql(['(', 'define', 'x', '3', ')'])
  end

  it "parses non-nested tokens into arrays" do
    tokens = @p.tokenize("(define x 3)")
    ast = @p.parse(tokens)

    expect(ast).to eql([:define, :x, 3.0])
  end

  it "parses tokens that are nested into arrays" do
    tokens = @p.tokenize("(define x (* 2 3))")
    ast = @p.parse(tokens)

    expect(ast).to eql([:define, :x, [:*, 2.0, 3.0]])
  end
end
