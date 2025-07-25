class CommentPolicy < ApplicationPolicy
  # NOTE: Up to Pundit v2.3.1, the inheritance was declared as
  # `Scope < Scope` rather than `Scope < ApplicationPolicy::Scope`.
  # In most cases the behavior will be identical, but if updating existing
  # code, beware of possible changes to the ancestors:
  # https://gist.github.com/Burgestrand/4b4bc22f31c8a95c425fc0e30d7ef1f5

  # tout visiteur peut poster un com si formulaire
  def create?
    true
  end

  def destroy?
    user.present? && record.post.user == user
    # vérifie si le user est co et si c'est l'auteur de l'article
  end

  # personne ne peut mettre à jour les coms
  def update?
    false
  end

  class Scope < ApplicationPolicy::Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end
end
