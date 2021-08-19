require "rails_helper"

RSpec.describe ClinicasController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/clinicas").to route_to("clinicas#index")
    end

    it "routes to #show" do
      expect(:get => "/clinicas/1").to route_to("clinicas#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/clinicas").to route_to("clinicas#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/clinicas/1").to route_to("clinicas#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/clinicas/1").to route_to("clinicas#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/clinicas/1").to route_to("clinicas#destroy", :id => "1")
    end
  end
end
