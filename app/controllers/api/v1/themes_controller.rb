class Api::V1::ThemesController < ApplicationController
    before_action :find_theme, only: [:show]

    def index
      @themes = Theme.all
      render json: @themes
    end

    def show
        render json: @theme, status: 200
    end

    def new
      @theme = Theme.new
    end

    def create
      @theme = Theme.new(theme_params)
      if @theme.valid? @theme.save
        render json: @theme
      else
        render json: {error: "Please complete required fields"}, status: 400
      end
    end

    def edit
    end

    def update
      @theme = Theme.find(params[:theme][:id])
      if @theme.update_attributes(theme_params)
        render json: {error: "Theme has been updated."}, status: :created
      else
        render json: {error: "Unable to update Theme."}, status: :not_acceptable
      end
    end

     def destroy
      @nugget = Nugget.find(params[:id])
      @nugget.destroy
    end

    private

    def find_theme
      @theme = Theme.find(params[:id])
    end
  
    def theme_params
      params.require(:theme).permit(:id, :name, :workspace_id)
    end
end