class Quest < ApplicationRecord
  validates :name, presence: true, uniqueness: true
end
