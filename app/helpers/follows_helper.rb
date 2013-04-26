module FollowsHelper
  def determine_user_no_following
    if current_user?(@user)
      "You aren't following anyone."
    else
      @user.username + " isn't following anyone."
    end
  end
  
  def determine_user_no_followers
    if current_user?(@user)
      "You have no followers."
    else
      @user.username + " has no followers."
    end
  end
end