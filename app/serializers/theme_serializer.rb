class ThemeSerializer < ActiveModel::Serializer
  attributes :id, :name
  # belongs_to :workspace
  has_many :nuggets
  class NuggetSerializer < ActiveModel::Serializer
    attributes :id, :title, :img_url, :video_url, :question, :body, :users
  end
end
