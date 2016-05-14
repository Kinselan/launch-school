# ..remove everything starting from "house".

advice = "Few things in life are as important as house training your pet dinosaur."

advice = advice.partition("house")[0]

p advice

# ls - i don't even see this option in the documentation??
advice.slice!(0, advice.index('house'))