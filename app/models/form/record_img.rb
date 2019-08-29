class Form::RecordImg < RecordImg
    REGISTRABLE_ATTRIBUTES = %i(id record_id order image _destroy)
  
    def find_records
      Record.find(params[:id])
    end
  end