module ApplicationHelper

  def user_fave
    @user_fave ||= @product.favourite_for(current_user)
  end

end
