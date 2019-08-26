class ActivitySerializer < ActiveModel::Serializer
  attributes :id, :begin_date, :end_date, :activity

  def editable
    scope == object.user
  end

end
