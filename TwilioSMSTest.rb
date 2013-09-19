require 'rubygems'
require 'twilio-ruby'

begin
  #check to see if there was a parameter passed
  if ARGV.length == 0
    abort "\n --> Error: Joseph Hassan would like you to know that this project requires that you pass in a phone number! and optionally a message as parameters"
  end

  #account authentication info
  account_sid = "" #=> You need to put in your account specific info here
  auth_token = "" #=> You need to put in your account specific info here
  client = Twilio::REST::Client.new account_sid, auth_token
  
  puts "Authenticated"
  
  #pre defined for this test account
  from_number = "" #=> You need to put in your account specific info here

  
  if ARGV[0]
    #obtain the number that we need to text
    to_number = ARGV[0].to_s
  end
  
  #log
  puts "Sending message to: " + to_number.to_s
  
  #obtain the message to send
  message_body = ARGV[1].to_s
  
  #make sure there is some message going out
  if message_body.length < 1
    message_body = "Hello World of SMS via Twilio! from Joseph Hassan 415-580-1463"
  end
  
  #log
  puts "Message body will be: " + message_body.to_s
  
  
  #send the message
  client.account.sms.messages.create(
        :from => from_number,
        :to => to_number,
        :body => message_body)
        
        
  puts "Congratulations, This is Joseph Hassan letting you know that the Message " + message_body + " was sent to " + to_number + " successfully!"
rescue
  puts "oops! Something went wrong! did you pass the phone number you want to text as a parameter?"
end