class CategoriesController < ApplicationController
	 before_action :set_category, only: [:show, :edit, :update, :destroy]
	# before_action :board_auth, only: [:edit, :update, :destroy]
 #    before_action :authenticate_user!, except: [:index,:show]

	def index
		@categories = Category.all	
	end

# 	#def new
# 	#	@board = current_user.boards.build
# 	#end
 
	def show		
	end


	# def create
	# 	@board = current_user.boards.build(board_params)
	# 	if @board.save
	# 		redirect_to boards_path ,notice:"Successfully created"
	# 	else
	# 		render 'new'
	# 	end
	# end

	# def edit
	# end


	# def update
	# 	if @category.update(category_params)
	# 		redirect_to categories_path, notice:"Category was successfully updated!"
	# 	else
	# 		render 'edit'
	# 	end
	# end

# 	#def destroy
# 	#	@board.destroy
# 	#	redirect_to boards_path, notice: "Board was deleted!"
# 	#end



   private 

	def category_params
       params.require(:category).permit(:name, :board_id)
    end

#     def board_auth
#         if current_user != @board.user
#         redirect_to boards_path, notice: "Not authorized"
#         end
#     end

    def set_category
    	@category = Category.find(params[:id])
    end

 end
