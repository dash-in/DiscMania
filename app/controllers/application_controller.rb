class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_search

  def set_search
    if params[:search].nil?
      @search = Record.ransack
    else
      @search = Record.includes(:artists).ransack(search_params)
    end
    @records = @search.result(distinct: true)
  end

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
    def after_sign_in_path_for(resourse)
      case resourse
      when User
        records_path
      when Admin
        admin_orders_path
      end
    end

  def search_params
    params.require(:search).permit!
  end
end