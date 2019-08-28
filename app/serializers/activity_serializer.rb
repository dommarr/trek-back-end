class ActivitySerializer < ActiveModel::Serializer
  attributes :id, :begin_date, :end_date, :activity_title, :trip_id

  def editable
    scope == object.user
  end

end
