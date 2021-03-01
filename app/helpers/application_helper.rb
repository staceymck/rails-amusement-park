module ApplicationHelper

  def navigation_links
    if current_user
      render "layouts/user_nav_links"
    else
      render "layouts/visitor_nav_links"
    end
  end
end
