class RecordsController < ApplicationController

  before_action :set_record, only: [:show]

  def index
    @q = Form::Record.includes(:tune).search
    # binding.pry
    jpops_count_id = Record.where(genre: "Japanese Rock / Pops / Indies").joins(:order_details).group(:record_id).limit(4).order('count_record_id DESC').count(:record_id).keys
      @jpops = jpops_count_id.map{|id| Record.find(id)}
    pops_count_id = Record.where(genre: "Rock / Pops / Indies").joins(:order_details).group(:record_id).limit(4).order('count_record_id DESC').count(:record_id).keys
      @pops = pops_count_id.map{|id| Record.find(id)}
    edms_count_id = Record.where(genre: "Electric Dance Music").joins(:order_details).group(:record_id).limit(4).order('count_record_id DESC').count(:record_id).keys
      @edms = edms_count_id.map{|id| Record.find(id)}
    ors_count_id = Record.where(genre: "Old Rock").joins(:order_details).group(:record_id).limit(4).order('count_record_id DESC').count(:record_id).keys
      @ors = ors_count_id.map{|id| Record.find(id)}
    hrs_count_id = Record.where(genre: "Hard Rock / Heavy Metal").joins(:order_details).group(:record_id).limit(4).order('count_record_id DESC').count(:record_id).keys
      @hrs = hrs_count_id.map{|id| Record.find(id)}
    punks_count_id = Record.where(genre: "PUNK").joins(:order_details).group(:record_id).limit(4).order('count_record_id DESC').count(:record_id).keys
      @punks = punks_count_id.map{|id| Record.find(id)}
    jazzs_count_id = Record.where(genre: "JAZZ").joins(:order_details).group(:record_id).limit(4).order('count_record_id DESC').count(:record_id).keys
      @jazzs = jazzs_count_id.map{|id| Record.find(id)}
    classics_count_id = Record.where(genre: "CLASSIC").joins(:order_details).group(:record_id).limit(4).order('count_record_id DESC').count(:record_id).keys
      @classics = classics_count_id.map{|id| Record.find(id)}
    sts_count_id = Record.where(genre: "Sound Track").joins(:order_details).group(:record_id).limit(4).order('count_record_id DESC').count(:record_id).keys
      @sts = sts_count_id.map{|id| Record.find(id)}
    sks_count_id = Record.where(genre: "昭和歌謡曲 / 演歌").joins(:order_details).group(:record_id).limit(4).order('count_record_id DESC').count(:record_id).keys
      @sks = sks_count_id.map{|id| Record.find(id)}
    idles_count_id = Record.where(genre: "アイドル").joins(:order_details).group(:record_id).limit(4).order('count_record_id DESC').count(:record_id).keys
      @idles = idles_count_id.map{|id| Record.find(id)}
    kpops_count_id = Record.where(genre: "K-POP").joins(:order_details).group(:record_id).limit(4).order('count_record_id DESC').count(:record_id).keys
      @kpops = kpops_count_id.map{|id| Record.find(id)}
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
    # @user_id = current_user.id
    # @user = User.find(params[:id])
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
