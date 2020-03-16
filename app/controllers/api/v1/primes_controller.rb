module Api::V1
    class PrimesController < ApplicationController
        def index
            @primes = PrimeCalculator.new(params[:amount].to_i)

            render json: @primes
        end
    end
end
