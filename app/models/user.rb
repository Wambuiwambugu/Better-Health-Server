class User < ActiveRecord::Base
    has_many :prescriptions
    has_many :reminders, through: :prescriptions
    validates_presence_of :name, :password, :email_address
    validates_uniqueness_of :email_address, :password

end