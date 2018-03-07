class PinsController < ApplicationController
    before_action :find_pin, only: [:show,:edit,:update,:destroy,:upvote]
    before_action :pin_auth, only: [:edit, :update, :destroy]
    before_action :authenticate_user!, except: [:index,:show]

	def index
		if params[:tag]
			@pins = Pin.tagged_with(params[:tag])
		else
			@pins = Pin.all
		end
	end

	def new
		@pin = current_user.pins.build
	end
 
	def show 
	end


	def create
		@pin = current_user.pins.build(pin_params)

		if @pin.save
			redirect_to @pin,notice:"Successfully created"
		else
			render 'new'
		end
	end

	def edit
	end


	def update
		if @pin.update(pin_params)
			redirect_to @pin,notice:"Pin was successfully updated!"
		else
			render 'edit'
		end
	end

	def destroy
		@pin.destroy
		redirect_to root_path
	end

	def upvote
		@pin.upvote_by current_user
		redirect_to :back
	end



	private 

	def pin_params
       params.require(:pin).permit(:title, :description, :image, :tag_list, :board_id)
    end

    def pin_auth
        if current_user !=@pin.user
        redirect_to(root_path)
        end
    end

    def find_pin
    	@pin=Pin.find(params[:id])
    end
end
