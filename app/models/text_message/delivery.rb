module TextMessage::Delivery
  # send message to Twilio for delivery
  def deliver!
    client.messages.create(delivery_params)
    update(delivered: true)
  end

  private

  def delivery_params
    params = {
      from: ENV["TWILIO_PHONE_NUMBER"],
      to: recipient_number,
      body: message_body
    }
    params[:media_url] = media_url if media_url.present?
    params
  end

  def client
    account_sid = ENV["TWILIO_ACCOUNT_SID"]
    account_token = ENV["TWILIO_ACCOUNT_TOKEN"]

    @client ||= Twilio::REST::Client.new account_sid, account_token
    @client
  end
end
