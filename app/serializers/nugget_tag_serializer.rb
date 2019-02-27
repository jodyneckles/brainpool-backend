class NuggetTagSerializer < ActiveModel::Serializer
  belongs_to :nugget
  belongs_to :tag
  attributes :id, :nugget_id, :tag_id
end
