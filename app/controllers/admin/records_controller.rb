class Admin::RecordsController < ArtistsController
    before_action :set_record, only: [:show, :edit, :update]
  
    def index
      @q = Record.search
    end

    def show
    end
  
    def search
      @q = Record.search(search_params)
      @records = @q.result.preload(:artist)
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
        redirect_to admin_records_path, notice: "レコード「#{@order.name}」を登録しました。"
      else
        render :new
      end
    end
  
    def update
      if @record.update_attributes(record_params)
        redirect_to admin_records_path, notice: "レコード「#{@order.name}」を更新しました。"
      else
        render :edit
      end
    end
  
    def destroy
      Record.find(params[:id]).destroy
      redirect_to admin_records_url, notice: 'レコードを削除しました。'
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
      params
        .require(:form_record)
        .permit(
          Form::Record::REGISTRABLE_ATTRIBUTES +
          [tunes_attributes: Form::Tune::REGISTRABLE_ATTRIBUTES]
        )
    end
end