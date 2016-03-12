account_sid = ENV["TWILIO_APP_ID"]
auth_token = ENV["TWILIO_APP_AUTH_TOKEN"]


Twilio_Client = Twilio::REST::Client.new account_sid, auth_token