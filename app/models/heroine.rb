class Heroine < ApplicationRecord
    belongs_to :power
    validates :super_name, uniqueness: true
    
    def self.search(params)
        # byebug
        power = Power.find_by(name: params)
       if power 
        where("power_id LIKE ?", "%#{power.id}%")
       end
    end 
end
