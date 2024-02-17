class NameMapsSerializer < ApplicationSerializer
    attributes :id, :name, :active, :icon, :route

    def active
        true
    end
    
    def icon 
        "Map"
    end

    def route 
        return "/map/" + self.object.id.to_s
    end
end