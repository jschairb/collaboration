# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def flash_div *keys
    divs = keys.select { |k| flash[k] }.collect do |k|
      content_tag :div, flash[k], :class => "flash #{k}" 
    end
    divs.join
  end

end
