module Api::V1
  class ScratchersController < ApiController
    
  	load_and_authorize_resource
    before_action :set_scratcher, only: [:show, :update, :destroy]

    # GET /users/1
    def show
      render json: @scratcher
    end

    #GET /Users
    def index
      @scratchers = Scratcher.all
      render json: @scratchers
    end

    # POST /users
    def create
      @scratcher = Scratcher.new(scratcher_params)

      if @scratcher.save
        render json: @scratcher
        #serializer: NewUsersSerializer
      else
        render json: @scratcher.errors, status: :unprocessable_entity
      end
    end

    # DELETE /users/1
    def destroy
      @scratcher.destroy
      render json: { status: "Scratcher successfully deleted from database" }
    end

    # PATCH/PUT /users/1
    def update
      if @scratcher.update(scratcher_params)
        render json: @scratcher
      else
        render json: @scratcher.errors, status: :unprocessable_entity
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_scratcher
        @scratcher = Scratcher.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def scratcher_params
        params.require(:scratcher).permit(:color, :price, :user_id)
      end
  end
end