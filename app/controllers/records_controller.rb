class RecordsController < ApplicationController

  before_action :set_record, only: [:show]

  def index
    @q = Form::Record.includes(:tune).search
    @jpops = Form::Record.where(genre: "Japanese Rock / Pops / Indies").limit(4).order(created_at: "DESC")
    @pops = Form::Record.where(genre: "Rock / Pops / Indies").limit(4).order(created_at: "DESC")
    @edms = Form::Record.where(genre: "Electric Dance Music").limit(4).order(created_at: "DESC")
    @ors = Form::Record.where(genre: "Old Rock").limit(4).order(created_at: "DESC")
    @hrs = Form::Record.where(genre: "Hard Rock / Heavy Metal").limit(4).order(created_at: "DESC")
    @punks = Form::Record.where(genre: "PUNK").limit(4).order(created_at: "DESC")
    @jazzs = Form::Record.where(genre: "JAZZ").limit(4).order(created_at: "DESC")
    @classics = Form::Record.where(genre: "CLASSIC").limit(4).order(created_at: "DESC")
    @sts = Form::Record.where(genre: "Sound Track").limit(4).order(created_at: "DESC")
    @sks = Form::Record.where(genre: "昭和歌謡曲 / 演歌").limit(4).order(created_at: "DESC")
    @idles = Form::Record.where(genre: "アイドル").limit(4).order(created_at: "DESC")
    @kpops = Form::Record.where(genre: "K-POP").limit(4).order(created_at: "DESC")
    @setting = Setting.find(1)
    # ここを追加
    @cart_item = CartItem.new
  end

  def search
    @q = Form::Record.search(params[:q])
    @records = @q.result(distinct: true).joins(:artist).includes(:artist).order("artists.name", created_at: "DESC")
    @setting = Setting.find(1)
  end

  def show
    @cart_item = CartItem.new
    @record = Record.find(params[:id])
    @setting = Setting.find(1)
    @review = Review.new
  end

  private

  def set_record
    @record = Form::Record.find(params[:id])
  end

  def search_params
    search_conditions = %i(
      name_cont artist_name_cont
    )
    params.require(:q).permit(search_conditions)
  end


end
