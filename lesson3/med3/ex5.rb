require 'pry'
def color_valid(color)
  if color == "blue" || color == "green"
    true
  else
    false
  end
end


# refactor to avoid duplication

def color_valid2(color)
  color == "blue" || color == "green"
end


binding.pry