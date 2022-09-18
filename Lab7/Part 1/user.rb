require_relative 'main'

create_file('F.txt', 'i love cats')
create_file('G.txt', 'i love kittens')
write_matches_to_file('F.txt', 'G.txt', 'H.txt')
