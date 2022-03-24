module Admin
  class DashboardController < BaseController
    before_action :load_book, only: :index
    def index
    end

    private

    def load_book
      binding.pry
      @books = Book.by_user(current_user.id)
    end
  end
end
