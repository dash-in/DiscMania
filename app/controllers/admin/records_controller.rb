class Admin::RecordsController < ArtistsController

    def index
      @jpops = Record.where(genre: 'Japanese Rock / Pops / Indies').limit(4).order('created_at DESC')
      @pops = Record.where(genre: 'Rock / Pops / Indies').limit(4).order('created_at DESC')
      @edms = Record.where(genre: 'Electric Dance Music').limit(4).order('created_at DESC')
      @ors = Record.where(genre: 'Old Rock').limit(4).order('created_at DESC')
      @hrs = Record.where(genre: 'Hard Rock').limit(4).order('created_at DESC')
      @punks = Record.where(genre: 'PUNK').limit(4).order('created_at DESC')
      @jazzs = Record.where(genre: 'JAZZ').limit(4).order('created_at DESC')
      @classics = Record.where(genre: 'CLASSIC').limit(4).order('created_at DESC')
      @sts = Record.where(genre: 'Sound Track').limit(4).order('created_at DESC')
      @sks = Record.where(genre: '昭和歌謡曲').limit(4).order('created_at DESC')
      @idles = Record.where(genre: 'アイドル').limit(4).order('created_at DESC')
      @kpops = Record.where(genre: 'K-POP').limit(4).order('created_at DESC')
      @setting = Setting.find(1)
    end

    def search
      @records = Form::Record.search(params[:search])
    end

    def show
      @record = Form::Record.find(params[:id])
    end
  
    def new
      @record = Form::Record.new
    end
  
    def edit
      @record = Form::Record.find(params[:id])
    end
  
    def create
      @record = Form::Record.new(record_params)
      if @record.save
        redirect_to admin_records_path, notice: "レコード「#{@record.name}」を登録しました。"
      else
        render :new
      end
    end
  
    def update
      if @record.update_attributes(record_params)
        redirect_to admin_records_path, notice: "レコード「#{@record.name}」を更新しました。"
      else
        render :edit
      end
    end
  
    def destroy
      Record.find(params[:id]).destroy
      redirect_to admin_records_url, notice: 'レコードを削除しました。'
    end
  
    private
  
    def search_params
      search_conditions = %i(
        name_cont artist_name_cont
      )
      params.require(:q).permit(search_conditions)
    end
  
    def record_params
      params
        .require(:form_record)
        .permit(
          Form::Record::REGISTRABLE_ATTRIBUTES +
          [tunes_attributes: Form::Tune::REGISTRABLE_ATTRIBUTES]
        )
    end
end