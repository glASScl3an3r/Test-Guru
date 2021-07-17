class Badge < ApplicationRecord
  has_and_belongs_to_many :users

  validates :title, presence: true
  validates :description, presence: true
  validates :image_name, presence: true
  validates :rule, presence: true
  validate :image_exist, on: %i[create update]
  validate :rule_is_available, on: %i[create update]

  #можно вне класса Badge сделать, но пусть будет так
  BADGE_RULES_PATH = 'app/services/specifications/badges/*.rb'.freeze
  def self.available_rules
    if @available_rules_strings.nil?
      @available_rules_strings = []
      Dir.glob(BADGE_RULES_PATH) do |file|
        @available_rules_strings << File.basename(file, '.rb')
      end
    end

    @available_rules_strings
  end

  BADGE_IMAGES_PATH = 'app/assets/images/badges/*'
  def self.available_images
    if @available_images_strings.nil?
      @available_images_strings = []
      Dir.glob(BADGE_IMAGES_PATH) do |file|
        @available_images_strings << File.basename(file)
      end
    end

    @available_images_strings
  end

  private

  def image_exist
    errors.add(:image_name, :file_missing) if !self.class.available_images.include?(image_name)
  end

  def rule_is_available
    errors.add(:rule, :rule_is_invalid) if !self.class.available_rules.include?(rule)
  end
end
