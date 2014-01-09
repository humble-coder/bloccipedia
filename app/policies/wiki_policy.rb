class WikiPolicy < ApplicationPolicy
  attr_reader :user, :wiki

  def initialize(user, wiki)
    @user = user
    @wiki = wiki
  end

  def show?
    wiki.users.include?(user) || wiki.public
  end

  def create?
    user.present?
  end

  def new?
    create?
  end

  def update?
    wiki.users.include?(user)
  end

  def edit?
    update?
  end

  def destroy?
    user.wikis.include?(wiki)
  end

  def scope
    Pundit.policy_scope!(user, Wiki)
  end


  class Scope < Struct.new(:user, :scope)
    def resolve
      if user.present?
        scope.all
      else
        scope.where(public: true)
      end
    end
  end
end
