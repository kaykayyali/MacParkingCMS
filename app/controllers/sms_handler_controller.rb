class SmsHandlerController < ApplicationController
	def test
		# client = EasySMS::Client.new('https://56e474fe29d9690006000005:91c5f7936cefe6b33dff17578e205683@api.easysmsapp.com/accounts/56e474fe29d9690006000005')
		Twilio_Client.account.messages.create({
			:from => ENV['TWILIO_NUMBER'], 
			:to => params[:phone], 
			:body => params[:body],  
		})
		render  json: {response: "Worked", status: 200}
	end
	def send_message
		Twilio_Client.account.messages.create({
			:from => ENV['TWILIO_NUMBER'], 
			:to => params[:phone], 
			:body => params[:body],  
		})
		render  json: {response: "Worked", status: 200}
	end
end
