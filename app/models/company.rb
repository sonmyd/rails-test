class Company < ApplicationRecord
  has_one :worker, dependent: :destroy
end
