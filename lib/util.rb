module Util
  def reverse_hash(list)
    reverse= [list .values, list .keys].transpose
    Hash[*reverse.flatten]
  end
end
