class ArtistsController < ApplicationController

    def index
        @artists = Artist.all
    end

    def search
        #Viewのformで取得したパラメータをモデルに渡す
        @artists = Artist.search(params[:search])
      end

    def show
        @artist = Artist.find(params[:id])
    end
    
    def new
        @artist = Artist.new
    end

    def create
        artist = Artist.new(artist_params)
        if artist.save
            redirect_to artists_path
        else
            render :new
        end
    end

    def edit
        @artist = Artist.find(params[:id])
    end

    def update
        @artist = Artist.find(params[:id])
        if @artist.update(artist_params)
            redirect_to artist_path(@artist.id)
        else
            render :edit
        end
    end

    def destroy
        @artist = Artist.find(params[:id])
        if @artist.destroy
            redirect_to artists_path
        else
            render :show
        end
    end

    private
    def artist_params
        params.require(:artist).permit(:name, :description, :deleted_at)
    end

end
