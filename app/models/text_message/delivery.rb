module TextMessage::Delivery
  # send message to Twilio for delivery
  def deliver!
    client.messages.create(
      from: ENV['TWILIO_PHONE_NUMBER'],
      to: recipient_number,
      body: message_body ,
      media_url: ['https://i1.sndcdn.com/artworks-000243212041-hcomm5-t500x500.jpg']
    )
    
    update(delivered: true)
  end

  private

  def client
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    account_token = ENV['TWILIO_ACCOUNT_TOKEN']

    @client ||= Twilio::REST::Client.new account_sid, account_token
    @client
  end
end