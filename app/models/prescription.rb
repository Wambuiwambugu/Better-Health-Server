class Prescription < ActiveRecord::Base
    belongs_to :User
    has_many :comments
    has_many :reminders
end