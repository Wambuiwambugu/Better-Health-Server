class Reminder < ActiveRecord::Base
    belongs_to :prescription
end