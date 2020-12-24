class BoatsController < ApplicationController

    def new
        @boat = Boat.new
    end

    def create
        raise params.inspect
    end

    def index
        @boats = Boat.all
    end

end
