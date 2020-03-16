Rails.application.routes.draw do
	namespace :api do
		namespace :v1 do
			get "turing", to: 'turing#index'
			get "primes", to: "primes#index"
		end
	end
end
