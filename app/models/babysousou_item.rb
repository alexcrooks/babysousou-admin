class BabysousouItem < ActiveRecord::Base
  paginates_per 20

  has_many :items

  validates :title, presence: true
end
