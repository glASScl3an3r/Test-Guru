module ApplicationHelper

  def github_url(author, repo)
    link_to 'Test-Guru',
            "https://github.com/#{author}/#{repo}",
            target: :_blank,
            rel: :nofollow
  end

  def current_year
    Time.current.year
  end

  def flash_msg(msg_type)
    content_tag :p, flash[msg_type], class: "flash #{msg_type}" if flash[msg_type]
  end

end
