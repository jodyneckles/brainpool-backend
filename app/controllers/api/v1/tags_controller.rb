class Api::V1::TagsController < ApplicationController
    before_action :find_tag, only: [:show]

    def index
      @tags = Tag.all
      render json: @tags
    end

    def show
      render json: @tag, status: 200
    end

    def new
      @tag = Tag.new
    end

    def create
      @tag = Tag.new(tag_params)
      if @tag.valid? @tag.save
        render json: @tag
      else
        render json: {error: "A tag name cannot be empty"}, status: 400
      end
    end

    private

    def find_tag
      @tag = Tag.find(params[:id])
    end
  
    def tag_params
      params.require(:tag).permit(:name)
    end
end


    # def edit
    # end

    # def update
    #   if @tag
    #     @tag.update(params[tag_params])
    #     render json: {error: "The tag details have been updated."}, status: :not_acceptable
    #   else
    #     render json: {error: "Unable to update the tag details."}, status: :not_acceptable
    #   end
    # end

    # def destroy
    #   @tag = Tag.find(params[:id])
    #   @tag.destroy
    # end