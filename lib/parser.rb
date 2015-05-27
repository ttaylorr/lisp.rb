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
end
