module SessionsHelper

  def flash_msg(msg_type)
    content_tag :p, flash[msg_type], class: "flash #{msg_type}" if flash[msg_type]
  end

end
