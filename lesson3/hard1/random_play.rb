# random play, lol. reminds me of facebook circa 2004...

hex = {}
chosen = 0

50.times do
  chosen = rand(0..15).to_s

  if hex.has_key?(chosen)
   hex[chosen] += 1
  else
    hex[chosen] = 1
  end

end

p hex