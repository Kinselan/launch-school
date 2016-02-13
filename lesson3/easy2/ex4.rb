

munsters_description = "The Munsters are creepy in a good way."

# convert to:
# "The munsters are creepy in a good way."
p munsters_description.gsub("M", "m")

# "tHE mUNSTERS ARE CREEPY IN A GOOD WAY."
p munsters_description.upcase.gsub("T","t").gsub("M","m")

# "the munsters are creepy in a good way."
p munsters_description.downcase

# "THE MUNSTERS ARE CREEPY IN A GOOD WAY."
p munsters_description.upcase

# LS: Ah, we had other, quicker ways. Important thing is the ! bang mutilator.
munsters_description.capitalize!
munsters_description.swapcase!
munsters_description.downcase!
munsters_description.upcase!