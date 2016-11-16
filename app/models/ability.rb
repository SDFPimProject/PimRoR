class Ability
  include CanCan::Ability

  def initialize(user)
    if !user.nil? and user.role == "admin" || user.role == "manager"  
      can :manage_users, :all
      else
      can :read, :all
    end

    if !user.nil? and user.users_teams.any? { |p| p.user_team_role == "manager"} || user.role == "admin" || user.role == "manager" 
      can :manage_teams, :all
      else
      can :read, :all
    end

    if !user.nil? and user.users_projects.any? { |p| p.user_project_role == "manager"} || user.role == "admin" || user.role == "manager" 
      can :manage_projetcs, :all
      else
      can :read, :all
    end
  end
end
