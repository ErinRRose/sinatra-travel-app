class User < ActiveRecord::Base
    has_secure_password

    has_many :travel_entries
    

end
