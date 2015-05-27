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

  def parse(tokens, tree=[])
    token = tokens.shift
    case token
      when "("; parse_block(tokens, tree)
      else; token
    end
  end

  private
  def parse_block(tokens, tree)
    tree.push(parse(tokens)) while tokens.first != ")"
    tokens.shift

    tree
  end
end
