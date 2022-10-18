class FriendPolicy < ApplicationPolicy
  def create?
    true
  end

  def destroy?
    is_friend?
  end

  def show?
    is_friend?
  end

  def is_friend?
    @user.friends.include?(@record)
  end
end