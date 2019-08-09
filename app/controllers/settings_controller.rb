class SettingsController < ApplicationController
    def show
    	@setting = Setting.find(params[:id])
    end

    def edit
    end

    def update

        @setting = Setting.find(params[:id])
    end

    def update
        setting = Setting.find(params[:id])
        if setting.update(setting_params)
            redirect_to setting_path(setting)
        else
            render action: :edit
        end
    end

    private
    def setting_params
        params.require(:setting).permit(:shop_address, :shop_tel, :shipping, :tax)
    end
end
