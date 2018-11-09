class Heroine < ApplicationRecord

  belongs_to :power, dependent: :destroy
  validates :super_name, uniqueness: true

end
