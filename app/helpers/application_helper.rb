module ApplicationHelper

  # Bootstrap default styles
  # alert-info      blue
  # alert-success   green
  # alert-warning   yellow
  # alert-danger    red
    def flash_class_for(level)
    'alert alert-dismissable ' +
      case level
      when 'success' then 'alert-success'
      when 'notice'  then 'alert-success'
      when 'alert'   then 'alert-warning'
      when 'error'   then 'alert-warning'
      else                'alert-success'
      end
  end
  
end
