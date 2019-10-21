class User < ApplicationRecord
    has_secure_password
    has_many :comments
    belongs_to :company

    before_create { generate_token(:auth_token) }



def generate_token(column)
  begin
    self[column] = SecureRandom.urlsafe_base64
  end while User.exists?(column => self[column])
end

def hello
  puts 'hello'
end

end
