class WikiPolicy < ApplicationPolicy
  class Scope < Struct.new(:user, :scope)
    def resolve
      scope.where(:public => true)
    end
  end
end
