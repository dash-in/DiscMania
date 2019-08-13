class Admin::RecordsController < ArtistsController
    def artists
        public_method(:typeahead_action).super_method.call
    end

    def new
        @record = Record.new
    end

    def create
        @record = Record.new(record_params)

    end

    private
    def record_params
        params.require(:record).permit(:image, :stock, :name, :artist_id, :price, :label, :genre, :deleted_at)
    end

end
