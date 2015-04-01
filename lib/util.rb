module Util
  def reverse_hash(list)
    reverse= [list .values, list .keys].transpose
    Hash[*reverse.flatten]
  end
  def nl2br(str)
    str.gsub(/\r\n|\r|\n/, "<br />")
  end
  def hbr(str)
    str = html_escape(str)
    str.gsub(/\r\n|\r|\n/, "<br />")
  end
end
