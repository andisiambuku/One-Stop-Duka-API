class CartSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :date, :status

  def date
    object.created_at.strftime("%Y-%m-%d")
  end
end
