class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :establishment

  def date
    self.created_at.to_date.strftime("%m/%d/%Y")
  end
end
