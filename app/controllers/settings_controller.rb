class SettingsController < ApplicationController
    def show
    	@setting = Setting.find(params[:id])
    end

    def edit
    end

    def update
    end
end
