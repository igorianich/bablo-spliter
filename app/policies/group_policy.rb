class GroupPolicy < ApplicationPolicy
  def create?
    true
  end

  def update?
    record_owner?
  end


  def destroy?
    record_owner?
  end

  def index?
    p '+++++++++++++++++++++++++'
    p 'user_member?'
    p user_member?
    user_member?
  end
  def show?
    p '+++++++++++++++++++++++++'
    p 'user_member?'
    p user_member?
    user_member?
  end

  def user_member?
    record.members.exists?(user.id)
  end
end