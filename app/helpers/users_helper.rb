module UsersHelper
  def user_active?(user) = ('active' if ((params[:id] == user.id.to_s) && (controller_name == "users")))
end
