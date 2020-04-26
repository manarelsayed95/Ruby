# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    
    can :read, Article
    can :read, Comment

    if user.present?  # additional permissions for logged in users (they can read their own Articles)
      can :manage, Article, user_id: user.id
      can :manage, Comment, user_id: user.id
    end
  end
end
