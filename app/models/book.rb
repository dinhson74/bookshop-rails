class Book < ApplicationRecord
  include CommonScope
  has_many :comments, dependent: :destroy
  has_many :orders, dependent: :destroy
  belongs_to :category
  belongs_to :user, optional: true

  mount_uploader :image, ImageUploader
  delegate :name, to: :user, prefix: :user, allow_nil: true

  validates :name, presence: true
  validates :price, presence: true
  validates :publisher, presence: true
  validates :category, presence: true

  # scope :by_user, ->(user_id) { where('user_id = ?', user_id) }

  def self.to_csv
    attributes = %w{name description price publisher image category_id user_id created_at updated_at}

    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |user|
        csv << attributes.map{ |attr| user.send(attr) }
      end
    end
  end

  def self.import_file(file)
    begin
    CSV.foreach(file.path, headers: true ) do |row|
      Book.create! row.to_hash
    end
    rescue Exception => e
      return "Error: #{e}"
    end
  end
end
