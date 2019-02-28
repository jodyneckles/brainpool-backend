class WorkspaceSerializer < ActiveModel::Serializer
  attributes :id, :name

  has_many :themes

  class ThemeSerializer < ActiveModel::Serializer
    attributes :id, :name

    has_many :nuggets

    class NuggetSerializer < ActiveModel::Serializer
      attributes :id, :title, :img_url, :video_url, :question, :body, :last_user

      def last_user
        self.object.users.last
      end
      has_many :users

      class UserSerializer < ActiveModel::Serializer
        attributes :id, :user_nuggets

        def user_nuggets
          self.object.user_nuggets
        end

      end
    end
  end

end
