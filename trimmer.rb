require 'decorator'
class TrimmerDecoratorr < Decorator
  def correct_name
    return unless @nameable.correct_name.size == 10

    @nameable.correct_name.strip
  end
end
