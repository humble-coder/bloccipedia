class ApplicationPolicy
  attr_reader :user, :wiki

  def initialize(user, wiki)
    @user = user || User.new # guest user
    @wiki = wiki
  end

  def index?
    false
  end

  def show?
    scope.where(:id => wiki.id).exists?
  end

  def create?
    @user.has_free_account? || @user.has_premium_account?
  end

  def new?
    create?
  end

  def update?
    false
  end

  def edit?
    update?
  end

  def destroy?
    wiki.user_id == user.id
  end

  def scope
    Pundit.policy_scope!(user, wiki.class)
  end
end

