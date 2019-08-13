class RecordsController < ApplicationController


    def top
    end
    
    def index
    end

    def show
      @record = Record.find(params[:id])
    end


end
