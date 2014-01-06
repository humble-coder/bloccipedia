class WikiPolicy < ApplicationPolicy

  def show?
    record.users.include?(user) || record.public
  end

  def create?
    user
  end

  def new?
    create?
  end

  def update?
    record.users.include?(user)
  end

  def edit?
    update?
  end

  def destroy?
    user.records.include?(record)
  end

  class Scope < Struct.new(:user, :scope)
    def resolve
      if user
        scope.all
      else
        scope.where(public: true)
      end
    end
  end
end
