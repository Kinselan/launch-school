answer = 42

def mess_with_it(some_number)
  some_number += 8
end

# new_answer = mess_with_it(42)
# new_answer = 50
new_answer = mess_with_it(answer)

# answer = 42, so answer - 8= 34
p answer - 8