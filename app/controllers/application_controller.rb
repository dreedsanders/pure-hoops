class ApplicationController < ActionController::Base
    skip_before_action :verify_authenticity_token #need this before configuring jwt or any auth

    def encode_token(payload)
        JWT.encode(payload, "magicword")
    end

    def decode_token
        header = request.headers['Authorization']
        if header
            token = header.split(" ")[1]
            begin JWT.decode(token, "magicword")
            rescue JWT::DecodeError
                nil
            end
        end
    end

end
