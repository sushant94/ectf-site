class User < ActiveRecord::Base
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

    attr_accessor :newTeam

    # validates :teamName, uniqueness: true
    after_create :createOrAddToTeam
    validate :checkTeam, on: :create
    belongs_to :team

    def checkTeam
        t = Team.where(teamName: self.teamName)
        if self.newTeam.to_i == 1
            if !t.empty?
                errors.add(:teamName, "Already exists. Choose a different name. If you intend to join this team, uncheck the box")
            end
        else
            if t.empty?
                errors.add(:teamName, "Does not exist. Please check the box to create it.")
            end
        end
    end

    def createOrAddToTeam
        t = Team.where(teamName: self.teamName)
        if t.empty?
            t = Team.create(teamName: self.teamName)
            self.team_id = t.id
            self.confirmed = true
            WelcomeMailer.delay.notify(self.id)
        else
            t = t.first
            self.team_id = t.id
            self.confirmed = false
        end
        self.save
        send_mail
    end


    private
    def send_mail
        WelcomeMailer.delay.welcome(self.id)
    end
end
