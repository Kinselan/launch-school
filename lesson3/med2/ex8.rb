require 'pry'
def foo(param = "no")
  "yes"
end

def bar(param = "no")
  param == "no" ? "yes" : "no"
end

# in method bar, I'm surprised param ever equals anything besides "no"

x = ''
y={}
# p foo

p bar("yes")
p bar("hi")
p bar(x)
p bar(y)

# p bar(foo)