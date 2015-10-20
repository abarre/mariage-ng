module V1
  #Fake class mapping the devise_token_auth routes
  class Users < Grape::API
    version 'v1'
    format :json

    resource :users do
      desc "Email registration." do
        detail "A verification email will be sent to the email address provided."
      end
      params do
        requires :email, type: String, desc: "Email of the user"
        requires :password, type: String, desc: "Password of the user"
        requires :password_confirmation, type: String, desc: "Password again of the user"
        optional :confirm_success_url, type: String
      end
      post "/"

      desc "Delete an account." do
        detail "This route will destroy users identified by their uid and auth_token headers."
      end
      delete "/"

      desc "Update an account." do
        detail "This route will update an existing user's account settings. The current_password param is checked before any update"
      end
      params do
        requires :password, type: String, desc: "Password of the user"
        requires :password_confirmation, type: String, desc: "Password again of the user"
      end
      put "/"

      desc "Email authentication."
      params do
        requires :email, type: String, desc: "Email of the user"
        requires :password, type: String, desc: "Password of the user"
      end
      post "/sign_in"

      desc "End the user's current session"
      delete "/sign_out"

      desc "Send a password reset confirmation email"
      params do
        requires :email, type: String, desc: "The user matching the email param will be sent instructions on how to reset their password."
        requires :redirect_url, type: String, desc: "redirect_url is the url to which the user will be redirected after visiting the link contained in the email."
      end
      post "/password"

      desc "Change the user's password" do
        detail "This route is only valid for users that registered by email (OAuth2 users will receive an error)."
      end
      params do
        requires :password, type: String, desc: "Password of the user"
        requires :password_confirmation, type: String, desc: "Password again of the user"
      end
      put "/password"

      desc "Facebook authentication", http_codes: [[301, 'Redirection to Facebook page']] do
        detail "Set this route as the destination for client authentication. Ideally this will happen in an external window or popup."
      end
      get "/facebook"

      desc "Validate tokens on return visits to the client." do
        detail "These values should correspond to the columns in your User table of the same names."
      end
      params do
        requires :uid, type: String, desc: "UID of the user"
        requires :"access-token", type: String, desc: "Access token of the user"
      end
      get "/validate_token"

    end
  end
end
