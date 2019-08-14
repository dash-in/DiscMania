class Form::Record < Record
    REGISTRABLE_ATTRIBUTES = %i(image name artist_id label genre stock price body)
    has_many :tunes, class_name: 'Form::Tune'
  
    after_initialize { tunes.build unless self.persisted? || tunes.present? }
  
    def selectable_artists
      Artist.all
    end
  end