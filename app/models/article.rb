class Article < ActiveRecord::Base
  belongs_to :author
  has_and_belongs_to_many :categories

  default_scope { published }

  validates_presence_of :author_id, :content

  def self.published
    where("publish_at <= ? AND publish_until >= ?", Time.now, Time.now)
  end

  def self.expired
    where("publish_at <= ? AND publish_until <= ?", Time.now, Time.now)
  end
end
