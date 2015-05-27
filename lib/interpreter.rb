class Interpreter
  def initialize
    @scope = Hash.new
  end

  def evaluate(expression)
    return expression if expression.is_a? Fixnum

    case expression[0]
    when :define
      _, identifier, value = expression
      @scope[identifier] = evaluate(value)
    else
      return @scope[expression[0]]
    end
  end
end
