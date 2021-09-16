class Monitoring < ApplicationRecord
  validates :service_title, :service_address, :presence => true
end
