class GroupEventSerializer < ActiveModel::Serializer
    attributes :id, :name, :description, :start_date, :end_date
    def end_date
      object.start_date + duration.days
    end
end