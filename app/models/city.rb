class City < ApplicationRecord
  has_many :forecasts
  belongs_to :region
  belongs_to :country
end
