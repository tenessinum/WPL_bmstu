def refactor_string(i_string)
  o_string = []

  i_string.split.map do |word|
    next unless word.match(/^[a-zA-Z0-9_\-+ ]*$/)

    word[0] = '_' if word[0] =~ /[0-9]/
    o_string.push(word)
  end

  o_string.join(' ')
end
