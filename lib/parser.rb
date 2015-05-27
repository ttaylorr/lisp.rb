class Parser
  # Public: Tokenizes some Lisp code
  #
  # expressions - the Lisp code to tokenize
  #
  # Examples
  #
  #   parser.tokenize('(define foo 3)')
  #   # => [ '(', 'define', 'foo', '3', ')' ]
  #
  # Returns the Lisp code as an array of tokens
  def tokenize(expressions)
    expressions.gsub('(', ' ( ')
               .gsub(')', ' ) ')
               .split(' ')
  end

  # Public: Parses a set of Lisp tokens (see #tokenize)
  #
  # tokens - the array of Lisp tokens to parse
  # tree - the AST that will be eventually returned (used for recuring)
  #
  # Examples
  #
  #   tokens = parser.tokenize('(define woot (* 3 2))')
  #   parser.parse(tokens)
  #   # => [ 'define', 'woot', ['*', '3', '2'] ]
  #
  # Returns the tokens as a parse tree according to the above specification
  def parse(tokens, tree=[])
    token = tokens.shift
    case token
      when "("; parse_block(tokens, tree)
      else; token
    end
  end

  private
  # Private: Parses a block of tokens until the block ends, recursively.
  #
  # See above (#parse(tokens, tree)) for more details.
  def parse_block(tokens, tree)
    tree.push(parse(tokens)) while tokens.first != ")"
    tokens.shift

    tree
  end
end
