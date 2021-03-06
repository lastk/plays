module ApplicationHelper
  include FacebookShare

  def flash_message
    types = { :notice => 'success', :alert => 'error', :info => 'info' }
    flash.inject("") do |sum, message|
      content_tag :div, :class => "alert alert-#{types[message[0]]}" do
        button_tag('&#215;'.html_safe, :type => 'button', :class => 'close', :'data-dismiss' => 'alert', :name => nil) +
        message[1]
      end
    end
  end
end
