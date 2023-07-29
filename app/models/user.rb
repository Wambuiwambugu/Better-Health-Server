class User < ActiveRecord::Base
    has_many :prescriptions
    
end