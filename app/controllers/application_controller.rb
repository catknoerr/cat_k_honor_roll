class ApplicationController < ActionController::Base
  respond_to :html, :json
  before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: %i[location username first_name
                                               last_name dm_id player_id])

    devise_parameter_sanitizer.permit(:account_update,
                                      keys: %i[location username first_name
                                               last_name dm_id player_id])
  end
end
