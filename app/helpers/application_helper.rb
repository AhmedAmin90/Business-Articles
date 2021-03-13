module ApplicationHelper
  def header_sign
    list = '<ul class= "nav">'
    if user_signed_in?
      list += "<li class='nav-item'> #{link_to 'Add Article', new_article_path, class: 'btn btn-light text-secondary'} |</li>"
      list += "<li class='nav-item'>#{link_to 'Sign out', destroy_user_session_path, method: :delete, class: 'btn btn-light text-secondary'} </li>"
    else
      list += "<li class='nav-item'> #{link_to 'Sign In', new_user_session_path, class: 'btn btn-light text-secondary'}|</li>"
      list += " <li class='nav-item'>#{link_to 'Sign Up', new_user_registration_path, class: 'btn btn-light text-secondary'} </li>"
    end
    list += '</ul>'
    list.html_safe
  end
end
