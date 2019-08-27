class TripSerializer < ActiveModel::Serializer
  attributes :id, :country, :city, :editable

  def editable
    scope == object.user
  end

end
