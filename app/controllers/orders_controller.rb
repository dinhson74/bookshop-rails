class OrdersController < ApplicationController
	before_action :load_book, only: [:new, :create]
	def new
		@order = Order.new
	end

	def create
		@order = Order.new(order_params)
		if @order.valid?
			@order.save
			redirect_to new_book_order_path
		else
			render :new
		end
	end

	private

	def order_params
		params.require(:order).permit(:telephone, :address, :discount, :amount).merge!(user_id: current_user.id, book_id: @book.id)
	end

	def load_book
		@book = Book.find_by(id: params[:book_id])
	end
end
