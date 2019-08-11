class SettingsController < ApplicationController
    before_action :authenticate_admin!
    
    def show
    	@setting = Setting.find(params[:id])
    end

    def edit
        @setting = Setting.find(params[:id])
    end

    def update
        @setting = Setting.find(params[:id])
        if @setting.update(setting_params)
            redirect_to setting_path(@setting)
        else
            render :edit
        end
    end

    private
    def setting_params
        params.require(:setting).permit(:shop_address, :shop_tel, :shipping, :tax)
    end
end
