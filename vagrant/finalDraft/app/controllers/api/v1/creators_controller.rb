class Api::V1::CreatorsController < Api::V1::BaseController

	before_action :offset_params, only: [:index]
	before_action :key_access
	#Gets a Creator and returns it
	def show
		crtr = Creator.find_by_id(params[:id])
		if crtr.nil?
			render json: { errors: "Couldn't find that creator, you probably gave me the wrong ID" }, status: :not_found
		else
			respond_with :api, crtr
		end
	end

	#Gets all the creators and formatit to fit the ofset and limit parameters
	def index
		creators = Creator.all
		creators = creators.drop(@offset)
		creators = creators.take(@limit)
		respond_with :api, creators, status: :ok
	end

	def creator_by_name
    respond_with :api, Creator.find_by_name(params[:name])
  end

end

