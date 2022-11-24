class Simons < ApplicationRecord
  validates :max_n, uniqueness: true
  def self.search(search)
    if search
      where(max_n: search)
    else
      all
    end
  end

  def self.search_id(search)
    select(:id).find_by(max_n: search) if search
  end
end
