class FriendPolicy < ApplicationPolicy
  def create?
    true
  end

  def destroy?
    is_friend?
  end

  def index?
    p '+++++++++++++++++++++++++'
    p 'user_member?'
    p user_member?
    user_member?
  end

  def show?
    is_friend?
  end

  def is_friend?
    @user.friends.include?(@record)
  end
end