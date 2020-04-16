class AchievementsController < ApplicationController
    def new
        @achievement = Achievement.new
    end

    def create
        new_achievement = Achievement.new(data_params)
        if new_achievement.save
            redirect_to achievement_path(new_achievement), notice: 'Achievement has been created'
        else
            flash.now[:danger] = "Fields can't be blank"
            render :new
        end
    end

    def show
        @achievement = Achievement.find(params[:id])
    end

    def index
        @achievements = Achievement.all    
    end

    def edit
        @achievement = Achievement.find(params[:id])
    end

    def update
        @achievement = Achievement.find(params[:id])
        if @achievement.update_attribures(data_params)
            redirect_to achievement_path(@achievement)
        else
            render :edit
        end
    end

    def destroy
        Achievement.destroy(params[:id])
        redirect_to achievements_path
    end

    private
    def data_params
        params.require(:achievement).permit(:title, :description, :privacy, :featured, :cover_image)
    end
end
