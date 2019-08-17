class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

  helper_method :current_cart


  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [
      :last_name,
      :first_name,
      :last_name_kana,
      :first_name_kana,
      :address,
      :post_number,
      :tel,
      :hundlename,
      ]
    )
  end

  private
  def after_user_sign_in_path_for(resourse_or_scope)
        records_path
  end
  def after_user_sign_out_path_for(resourse_or_scope)
        top_path
  end
end