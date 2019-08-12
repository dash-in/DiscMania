class RecordsController < ApplicationController

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

    def edit
    end

    def update
    end

    def destroy
    end

end
