class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  before_action :set_account

  def google_oauth2
    if @user.persisted?
      flash[:notice] = I18n.t 'devise.omniauth_callbacks.success', kind: 'Google'
      sign_in_and_redirect @user, event: :authentication
    else
      # Removing extra as it can overflow some session stores
      session['devise.google_data'] = request.env['omniauth.auth'].except('extra')
      redirect_to new_user_registration_path, alert: @user.errors.full_messages.join("\n")
    end
  end

  private

  def set_account
    @user = User.from_omniauth(request.env['omniauth.auth'])
  end
end