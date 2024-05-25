class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  def self.search(query)
    where("title LIKE ?", "%#{query}%")
  end
end
