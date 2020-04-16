class Achievement < ApplicationRecord
    belongs_to :user
    validates_presence_of :title
    #validates_uniqueness_of :title
    validates :title , uniqueness: {
        scope: :user_id,
        message: "you can't have two achievements with the same title"
    }
    enum privacy: [:public_access, :private_access, :friends_access]
    
    def description_html
        Redcarpet::Markdown.new(Redcarpet::Render::HTML).render(description)
    end
    private
    
=begin     validate :unique_title_for_one_user
    def unique_title_for_one_user
        existing_achievement = Achievement.find_by(title: title)
        if existing_achievement && existing_achievement.user == user
            errors.add(:title, "you can't have two achievements with the same title" )
        end
    end
=end
end
