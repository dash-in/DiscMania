class Form::Tune < Tune
    REGISTRABLE_ATTRIBUTES = %i(id record_id disc_no tune_order tune_name _destroy)
  
    def find_records
      Record.find(params[:id])
    end
  end