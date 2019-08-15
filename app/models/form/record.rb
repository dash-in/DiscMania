class Form::Record < Record
    REGISTRABLE_ATTRIBUTES = %i(image name artist_id label genre stock price body id deleted_at)
    has_many :tunes, class_name: 'Form::Tune'
  
    after_initialize { tunes.build unless self.persisted? || tunes.present? }
  
    def selectable_artists
      Artist.all.order("name")
    end
  end