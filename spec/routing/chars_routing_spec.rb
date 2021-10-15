require "rails_helper"

RSpec.describe CharsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/chars").to route_to("chars#index")
    end

    it "routes to #show" do
      expect(get: "/chars/1").to route_to("chars#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/chars").to route_to("chars#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/chars/1").to route_to("chars#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/chars/1").to route_to("chars#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/chars/1").to route_to("chars#destroy", id: "1")
    end
  end
end
