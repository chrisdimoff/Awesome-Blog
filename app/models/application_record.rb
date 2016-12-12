class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def short_create_date
    self.created_at.strftime('%m/%d/%Y')
  end
end
