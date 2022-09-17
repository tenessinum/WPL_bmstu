def get_k_min_max(array, param_k)
  k_min_array = array.sort
  k_max_array = array.sort { |a, b| b <=> a }

  (array.length - param_k).times do
    k_max_array.pop
    k_min_array.pop
  end

  [k_min_array, k_max_array]
end
