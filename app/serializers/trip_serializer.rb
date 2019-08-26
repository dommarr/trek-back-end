class TripSerializer < ActiveModel::Serializer
  attributes :id, :country, :city

  def editable
    scope == object.user
  end

end
