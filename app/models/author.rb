class Author < ActiveRecord::Base
  belongs_to :source
  has_many :categories, as: :authorable
  has_many :items, inverse_of: :item

  validates_uniqueness_of :name, :scope => :source_id
end
