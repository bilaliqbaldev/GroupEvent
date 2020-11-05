module GroupEventsHelper
    def date_format date
        date.present? ? date.strftime('%Y-%m-%d') : ''
    end
end
