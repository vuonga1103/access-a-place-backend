class Review < ApplicationRecord
  belongs_to :user
  belongs_to :establishment

  def date
    self.updated_at.to_date.strftime("%m/%d/%Y")
  end
  
end
