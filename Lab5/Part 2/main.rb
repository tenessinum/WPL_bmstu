def rewrite(strings_array)
  strings = strings_array
  strings.map.with_index do |string, i|
    words = string.split(' ')
    words.map.with_index do |word, j|
      words[j] = word.reverse if j.odd?
    end
    strings[i] = words.join(' ')
  end
  strings
end
