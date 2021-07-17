class Badge < ApplicationRecord
  has_and_belongs_to_many :users

  validates :title, presence: true
  validates :description, presence: true
  validates :image_name, presence: true
  validates :rule, presence: true
  validate :image_exist, on: %i[create update]

  private

  def image_exist
    img = ActionController::Base.helpers.resolve_asset_path("badges/#{image_name}")
    errors.add(:image_name, :file_missing) if img.nil?
  end
end
