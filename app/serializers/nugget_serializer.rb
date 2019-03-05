class NuggetSerializer < ActiveModel::Serializer
  attributes :id, :title, :img_url, :video_url, :question, :body, :theme
  # belongs_to :theme
  has_many :nugget_tags
  has_many :user_nuggets
  belongs_to :theme

  class ThemeSerializer < ActiveModel::Serializer
    attributes :id, :name, :workspace
  end
end
