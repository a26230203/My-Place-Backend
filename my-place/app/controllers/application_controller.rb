class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  
    def encode_token(payload)
        JWT.encode(payload, "my-place", "HS256")
      end
end
