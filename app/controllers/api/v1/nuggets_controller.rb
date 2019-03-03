class Api::V1::NuggetsController < ApplicationController
    before_action :find_nugget, only: [:show, :edit, :update]
    
    def index
      @nuggets = Nugget.all
      render json: @nuggets
    end
    
    def show
      @nugget = Nugget.find(params[:id])
      render json: @nugget, status: 200
    end

    def new
      @nugget = Nugget.new
    end

    def create
      @nugget = Nugget.new(nugget_params)
      # byebug
      if @nugget.valid? 
        @nugget.save
        render json: @nugget
      else
        render json: {error: "Please complete required fields"}, status: 400
      end
    end

    def update
      @nugget = Nugget.find(params[:id])
      if @nugget.update_attributes(nugget_params)
        render json: {error: "Nugget has been updated."}, status: :created
      else
        render json: {error: "Unable to update Nugget."}, status: :not_acceptable
      end
    end

    def destroy
      @tag = Nugget.find(params[:id])
      @tag.destroy
    end

    private

    def find_nugget
      @nugget = Nugget.find(params[:id])
    end
  
    def nugget_params
      params.require(:nugget).permit(:title, :img_url, :video_url, :question, :body, :theme_id)
    end
end
