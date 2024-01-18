class ApplicationController < ActionController::API
    include JsonWebToken
    
    before_action :authenticate_request

    private
    def authenticate_request
        header = request.headers["Authorization"]
        header = header.split(' ').last if header
        decode = jwt_decode(header)
        @current_user = User.find(decode[:user_id])
    end

    def current_user
        @current_user
    end
end
