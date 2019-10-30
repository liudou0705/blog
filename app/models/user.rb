class User < ApplicationRecord
  has_secure_password
  has_many :comments
  before_create { generate_token(:auth_token) }
  validates :name, :email, presence: true
  validates :name, :email, uniqueness: { case_sensitive: false }
  validates :password, :length => { :minimum => 6, allow_blank: true }

  SEX = {
    'boy' => '男',
    'girl' => '女'
  }

  enum sex: {
    'boy' => '男',
    'girl' => '女'
  }

  enum category: {
    employee: 1,
    leader:   2,
    ceo:      3,
    cfo:      4,
    cto:      5
  }

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end

  def avatar
    gravatar_id = Digest::MD5.hexdigest(self.email.downcase) if self.email
    "http://gravatar.com/avatar/#{gravatar_id}.png?s=512&d=retro"
  end

end
