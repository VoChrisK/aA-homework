class User < ApplicationRecord
    validates :username, :session_token, presence: true
    validates :password_digest, presence: true
    validates :password, length: { minimum: 6, allow_nil: true }
    validate :password_cant_be_blank
    before_validation :ensure_session_token

    def self.find_by_credentials(username, password)
        encrypted_password = BCrypt::Password.create(password)
        found_user = User.find_by(username: username)
        if found_user
            if BCrypt::Password.new(found_user.password_digest).is_password?(encrypted_password)
                return found_user
            end
        end

        return nil
    end

    def self.generate_session_token
        SecureRandom::urlsafe_base64
    end

    def reset_session_token!
        self.session_token = self.class.generate_session_token
        self.save!
    end

    def ensure_session_token
        self.session_token ||= self.class.generate_session_token
    end

    def password=(pass)
        @password = pass
        self.password_digest = BCrypt::Password.create(pass)
    end

    def password_cant_be_blank
        if self.password_digest.nil? || self.password_digest.length == 0
            errors[:password_digest] << "Password cannot be blank!"
        end
    end

    attr_reader :password
end
