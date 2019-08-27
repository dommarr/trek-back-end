class ActivitySerializer < ActiveModel::Serializer
  attributes :id, :begin_date, :end_date, :activity_title

  def editable
    scope == object.user
  end

end
