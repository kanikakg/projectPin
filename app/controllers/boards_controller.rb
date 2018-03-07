class BoardsController < ApplicationController
	before_action :set_board, only: [:show, :edit, :update, :destroy]
	before_action :board_auth, only: [:edit, :update, :destroy]
    before_action :authenticate_user!, except: [:index,:show]

	def index
		@boards = Board.all
	end

	def new
		@board = current_user.boards.build
	end
 
	def show 
	end


	def create
		@board = current_user.boards.build(board_params)
		if @board.save
			redirect_to boards_path ,notice:"Successfully created"
		else
			render 'new'
		end
	end

	def edit
	end


	def update
		if @board.update(board_params)
			redirect_to boards_path, notice:"board was successfully updated!"
		else
			render 'edit'
		end
	end

	def destroy
		@board.destroy
		redirect_to boards_path, notice: "Board was deleted!"
	end



	private 

	def board_params
       params.require(:board).permit(:name)
    end

    def board_auth
        if current_user != @board.user
        redirect_to boards_path, notice: "Not authorized"
        end
    end

    def set_board
    	@board = Board.find(params[:id])
    end


end
