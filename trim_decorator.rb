require_relative 'base_decorator'

class TrimmerDecorator < BaseDecorator
  def correct_name
    name = super
    if name.length > 10
      "#{name[0..9]}..."
    else
      name
    end
  end
end
