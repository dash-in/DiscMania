class Admin::RecordsController < ArtistsController

  before_action :set_record, only: [:show, :edit, :update, :destroy]

  def index
    @q = Form::Record.includes(:tune).search
    @jpops = Form::Record.where(genre: "Japanese Rock / Pops / Indies").limit(4).order(:stock)
    @pops = Form::Record.where(genre: "Rock / Pops / Indies").limit(4).order(:stock)
    @edms = Form::Record.where(genre: "Electric Dance Music").limit(4).order(:stock)
    @ors = Form::Record.where(genre: "Old Rock").limit(4).order(:stock)
    @hrs = Form::Record.where(genre: "Hard Rock / Heavy Metal").limit(4).order(:stock)
    @punks = Form::Record.where(genre: "PUNK").limit(4).order(:stock)
    @jazzs = Form::Record.where(genre: "JAZZ").limit(4).order(:stock)
    @classics = Form::Record.where(genre: "CLASSIC").limit(4).order(:stock)
    @sts = Form::Record.where(genre: "Sound Track").limit(4).order(:stock)
    @sks = Form::Record.where(genre: "昭和歌謡曲 / 演歌").limit(4).order(:stock)
    @idles = Form::Record.where(genre: "アイドル").limit(4).order(:stock)
    @kpops = Form::Record.where(genre: "K-POP").limit(4).order(:stock)
    @setting = Setting.find(1)
  end

  def search
    # @q = Form::Record.search(search_params)
    # @records = @q
    #   .result(distinct: true)
    #   .order(:artist_name, created_at: :desc)
    @q = Form::Record.search(params[:q])
    @records = @q.result(distinct: true).order(:stock)
  end

  def show
    @record = Record.find(params[:id])
    @setting = Setting.find(1)
  end

  def new
    @record = Form::Record.new
  end

  def edit
  end

  def create
    @record = Form::Record.new(record_params)
    if @record.save
      redirect_to search_admin_records_path, notice: "レコード「#{@record.name}」を登録しました。"
    else
      render :new
    end
  end

  def update
    if @record.update_attributes(record_params)
      redirect_to search_admin_records_path, notice: "レコード「#{@record.name}」を更新しました。"
    else
      render :edit
    end
  end

  def destroy
    @record.destroy
    redirect_to search_admin_records_url, notice: 'レコードを削除しました。'
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

  def record_params
    params.require(:form_record).permit(Form::Record::REGISTRABLE_ATTRIBUTES + [tunes_attributes: Form::Tune::REGISTRABLE_ATTRIBUTES])
  end

  def update_record_params
    params.require(:form_record).permit(:stock)
  end
end