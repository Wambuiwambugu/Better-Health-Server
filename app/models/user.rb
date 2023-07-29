class User < ActiveRecord::Base
    has_many :prescriptions
    has_many :reminders, through: :prescriptions
    validates_presence_of :name, :password, :email
    validates_uniqueness_of :name, :password

end