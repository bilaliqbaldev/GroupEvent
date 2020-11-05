class GroupEvent < ApplicationRecord
    acts_as_paranoid

    enum status: [ :draft, :publish ]
    
    belongs_to :user
    has_one :address, dependent: :destroy
    accepts_nested_attributes_for :address, allow_destroy: true

    validates :name, presence: true
    validates :start_date, presence: true, if: :status_publish?
    validates :duration, presence: true, if: :status_publish?
    validates :description, presence: true, if: :status_publish?

    def get_coordinates group_event_obj
        results = Geocoder.search(group_event_obj.address)
        co_ordinates = {}
        co_ordinates[:lat] =  results.first.coordinates[0] unless results.empty?
        co_ordinates[:lng] = results.first.coordinates[1] unless results.empty?
        co_ordinates
    end

    def end_date
        (start_date.present? && duration.present?) ? start_date + duration.days : " "
    end

    def publish
        status = 1
        save!
    end

    def event_publish_able?
        name.present? &&
        start_date.present? && 
        duration.present? &&
        description.present? &&
        nested_attributes_options.keys.present?
    end

    def status_publish? 
        status == "publish"
    end

end
