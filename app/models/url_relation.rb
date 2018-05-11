class UrlRelation < ApplicationRecord
  validates :short_version, presence: true
  validates :full_version, presence: true

end
