class Admin::UsersController < Admin::ApplicationController
    before_action :set_user

    def index
      @users = User.all
    end

    def show

    end

    def edit
    end

    def destroy
    end

  end