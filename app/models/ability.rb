class Ability
  include CanCan::Ability

  def initialize(user)
    if user.admin?
      can :manage, User
    else
      can :read, User
      can :read, Client
    end
  end
end
