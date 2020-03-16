Rails.application.routes.draw do
	namespace :api do
		namespace :v1 do
			get "turing", to: 'turing#index'
		end
	end
end
