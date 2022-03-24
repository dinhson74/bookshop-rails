module CommonScope
  extend ActiveSupport::Concern

	included do
		scope :by_user, ->(user_id) { where('user_id = ?', user_id) }
	end
end
