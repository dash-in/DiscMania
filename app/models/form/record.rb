class Form::Record < Record
    REGISTRABLE_ATTRIBUTES = %i(image name artist_id label genre stock price body id deleted_at)
    has_many :tunes, class_name: 'Form::Tune'
    has_many :record_imgs, class_name: 'Form::RecordImg'
  
    after_initialize { tunes.build unless self.persisted? || tunes.present? }
    after_initialize { record_imgs.build unless self.persisted? || record_imgs.present? }
  
    def selectable_artists
      Artist.all.order("name")
    end
  end