class NuggetSerializer < ActiveModel::Serializer
  attributes :id, :title, :img_url, :video_url, :question, :theme
  # belongs_to :theme
  has_many :nugget_tags
  has_many :user_nuggets
  belongs_to :theme

  class ThemeSerializer < ActiveModel::Serializer
    attributes :name, :workspace
  end

  # class NuggetTagSerializer < ActiveModel::Serializer
  #   attributes :id, :nugget_id, :tag_id
  # end
  # class UserNuggetSerializer < ActiveModel::Serializer
  #   belongs_to :users
  #   attributes :id, :user_id, :nugget_id
  
  # end
  # class UserSerializer < ActiveModel::Serializer
  #   has_many :user_nuggets
  #   attributes :id, :username
  # end
end
