class WorkspaceSerializer < ActiveModel::Serializer
  attributes :id, :name

  has_many :themes
  class ThemeSerializer < ActiveModel::Serializer
    attributes :id, :name, :nuggets
    
  end
end
