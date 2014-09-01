class Source < ActiveRecord::Base
  belongs_to :author, class_name: 'User'

  validates :title, presence: true
  validates :url, presence: true, url: true
  validates :feed_url, presence: true, uniqueness: true
  validates_associated :author
end
