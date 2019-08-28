class ShippingInfosController < ApplicationController
    before_action :authenticate_user!

    def edit
        @shipping = ShippingInfo.find(params[:id])
    end

    def update
        @shipping = ShippingInfo.find(params[:id])
        if @shipping.update(shipping_params)
            redirect_to user_path(@shipping.user_id)
        else
            render :edit
        end
    end

    def destroy
        @shipping = ShippingInfo.find(params[:id])
        if @shipping.destroy
            redirect_to user_path(@shipping.user_id)
        else
            render user_path(@shipping.user_id)
        end
    end

    private
    def shipping_params
        params.require(:shipping_info).permit(:user_id, :name, :post_number, :address)
    end
end
