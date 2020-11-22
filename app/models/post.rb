class Post < ActiveRecord::Base
  belongs_to :user
  validates :user, presence: true
  validates :title, presence: true, length: { minimum: 5 }, uniqueness: { case_sensitive: false }
  validates :url, presence: true, format: { with: URI::DEFAULT_PARSER.make_regexp }
end
