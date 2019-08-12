class RecordsController < ApplicationController


    def top
    end
    
    def index
    end

    def show
      @record = Record.find(params[:id])
    end

    def index
    end

    def show
    end

    def new
        @record = Record.new
    end

    def create
        @record = Record.new(record_params)
    end

end
