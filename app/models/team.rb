class Team < ActiveRecord::Base
    has_many :users
    validates :teamName, presence: true
end
