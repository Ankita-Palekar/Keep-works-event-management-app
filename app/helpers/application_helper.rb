module ApplicationHelper
  def format_date(date, format)
    return date.strftime(format)
  end
  
end
