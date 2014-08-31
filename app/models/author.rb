class Author < ActiveRecord::Base
  belongs_to :source
  has_many :categories, as: :authorable

  validates_uniqueness_of :name, :scope => :source_id
end
