class Api::V1::WorkspacesController < ApplicationController
    before_action :find_workspace, only: [:show, :edit, :update]

    def index
      @workspaces = Workspace.all
      render json: @workspaces
    end

    def show
        render json: @workspace, status: 200
    end

    def new
      @workspace = Workspace.new
    end

    def create
      @workspace = Workspace.new(workspace_params)
      if @workspace.valid? @workspace.save
        render json: @workspace
      else
        render json: {error: "Please complete required fields"}, status: 400
      end
    end

    def edit
    end

    def update
      @workspace = Workspace.find(params[:id])
      if @workspace.update_attributes(workspace_params)
        render json: {error: "Workspace has been updated."}, status: :created
      else
        render json: {error: "Unable to update Workspace."}, status: :not_acceptable
      end
    end

    # def destroy
    #   @workspace = Workspace.find(params[:id])
    #   @workspace.destroy
    # end

    private

    def find_workspace
      @workspace = Workspace.find(params[:id])
    end
  
    def workspace_params
      params.require(:workspace).permit(:name)
    end
end
