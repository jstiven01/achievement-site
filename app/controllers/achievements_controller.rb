class AchievementsController < ApplicationController
    def new
        @achievement = Achievement.new
    end

    def create
        new_achievement = Achievement.new(data_params)
        if new_achievement.save
            redirect_to root_path, notice: 'Achievement has been created'
        else
            flash[:error] = 'Error creating achievement'
        end
    end

    private
    def data_params
        params.require(:achievement).permit(:title, :description, :privacy, :featured, :cover_image)
    end
end
