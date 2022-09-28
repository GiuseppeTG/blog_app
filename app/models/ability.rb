class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?

    can %i[read create], :all
    can :destroy, Post, author: user
    can :destroy, Comment, author: user
    return unless user.admin?

    can :manage, :all
  end
end
