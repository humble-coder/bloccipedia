class WikiPolicy < ApplicationPolicy
  class Scope < Struct.new(:user, :scope)
    def resolve
      if user && user.role == "Premium"
        scope.where(user_id: user.id)
      end
      scope.where(public: true)
    end
  end
end
