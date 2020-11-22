class User < ActiveRecord::Base
  has_many :posts
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, format: { with: /\A.*@.*\.com\z/ }

  before_validation :strip_blanks
  after_create :send_email_to_user

  private

  def strip_blanks
    self.email = email.strip unless email.nil?
  end

  def send_email_to_user
    FakeMailer.instance.mail(email, 'Welcome to HN!')
  end
end
