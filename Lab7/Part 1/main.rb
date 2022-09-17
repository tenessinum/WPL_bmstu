def create_file_f(ints)
  File.write('F.txt', ints.map(&:to_s).join(' '))
end

def create_file_p(variant)
  ints = File.readlines('F.txt', chomp: true).join(' ').split.map(&:to_i)
  negative_ints = ints.select(&:negative?)
  positive_ints = ints.select(&:positive?)
  new_ints = []

  iter = case variant
         when 1
           5
         when 2
           20
         else
           1
         end

  while new_ints.length < ints.length
    iter.times do
      new_ints.push(positive_ints.pop)
    end
    iter.times do
      new_ints.push(negative_ints.pop)
    end
  end

  File.write('P.txt', new_ints.map(&:to_s).join(' '))
end
