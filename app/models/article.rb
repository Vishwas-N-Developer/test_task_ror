class Article < ApplicationRecord

  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  attr_accessor :tag_list

  belongs_to :author, class_name: 'User'
  has_and_belongs_to_many :tags
  belongs_to :category
  has_many :comments, dependent: :destroy
  
  mount_uploader :cover, CoverUploader

  validates :title, presence: true
  
  def toggle_published!
    self.published = !published
    save
  end

  def self.search_published(query)
    self.search({
      query: {
        bool: {
          must: [
          {
            multi_match: {
              query: query,
              fields: [:title, :description]
            }
          },
          {
            match: {
              published: true
            }
          }]
        }
      }
    })
  end

end