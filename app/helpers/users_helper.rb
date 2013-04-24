module UsersHelper
  
  def determine_user_nom_header
    if current_user?(@user)
      "Your Noms!"
    else
      @user.username + "'s Noms!"
    end
  end
end
