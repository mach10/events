class Event < ActiveRecord::Base

  validates :title, :start, :owner,  presence: true

  validates :start, numericality: {greater_than: Time.now.getutc.to_i}

end