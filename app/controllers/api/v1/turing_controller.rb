module Api::V1
    class TuringController < ApplicationController
        def index
            params[:instructions].gsub!('*', '+')
            @machine = TuringMachine.new
            @machine.execute(params[:instructions])

            render json: @machine

            # render json: params
        end
    end
end
