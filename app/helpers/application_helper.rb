module ApplicationHelper
  def fix_url(str)
    str.starts_with?('http://') ? str : "http://#{str}"
  end

  def display_datetime(time)
    time.strftime("%m/%d/%Y 1:%M%P %Z")
  end
end
