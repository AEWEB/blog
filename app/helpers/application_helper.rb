module ApplicationHelper
  def nl2br(str)
    str = html_escape(str)
    str.gsub(/\r\n|\r|\n/, "<br />")
  end
end