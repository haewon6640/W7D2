# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  email           :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
    validates :email, presence:true, uniqueness:true
    validates :password_digest, presence: true
    validates :session_token, presence: true, uniqueness:true
    validates :password, length:{minimum: 6}, allow_nil: true
    attr_reader :password
    after_initialize :ensure_sesssion_token

    def self.generate_session_token
        SecureRandom::urlsafe_base64
    end

    def self.find_by_credentials(email, password)
        @user = self.find_by(email: email)
        if @user && @user.is_password?(password)
            return @user
        else
            return nil
        end
    end
    def reset_session_token!
        self.session_token = self.class.generate_session_token
        self.save!
        self.session_token
    end

    def ensure_sesssion_token
        self.session_token ||= self.class.generate_session_token
    end

    def password=(password)
        self.password_digest = BCrypt::Password.create(password)
        @password = password
    end

    def is_password?(password)
        password_object = BCrypt::Password.new(self.password_digest)
        password_object.is_password?(password)
    end


end 