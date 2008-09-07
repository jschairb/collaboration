class Presence < ActiveRecord::Base
  belongs_to :room
  belongs_to :user

  def touch
    updated_at_will_change!
    save
  end
end
