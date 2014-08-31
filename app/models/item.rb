class Item < ActiveRecord::Base
  belongs_to :author, inverse_of: :items
  has_and_belongs_to_many :categories

  validates :url, uniqueness: true
end
