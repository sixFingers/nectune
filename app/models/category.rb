class Category < ActiveRecord::Base
  belongs_to :authorable, polymorphic: true
  has_and_belongs_to_many :items
end
