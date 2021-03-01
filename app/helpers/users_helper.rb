module UsersHelper
  def profile_header
    if @user.admin
      content_tag(:h1, "ADMIN")
    else
      content_tag(:h1, "GUEST")
    end
  end
end
