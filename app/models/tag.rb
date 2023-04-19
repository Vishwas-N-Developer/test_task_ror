class Tag < ApplicationRecord
	has_and_belongs_to_many :articles
	validates :name, presence: true, uniqueness: { case_sensitive: false }

  before_save :normalize_name

  private

  def normalize_name
    self.name = name.downcase
  end
end
