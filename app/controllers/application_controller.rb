class ApplicationController < ActionController::Base
  include Pundit

#gérer les erreurs d'autorisation pundit
rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

private

def user_not_authorized
  flash[:alert] = "Vous n'êtes pas autorisé à effectuer cette action!"
  redirect_to (request.referrer || root_path)
end

end
