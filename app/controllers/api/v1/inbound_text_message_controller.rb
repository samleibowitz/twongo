class Api::V1::InboundTextMessageController < ApplicationController
  def create
    InboundTextMessage.create!(raw_data: permitted_params.to_h)
    response = OutboundTextMessage.create!(
      message_body: "Oh hi Mark!",
      recipient_number: permitted_params.to_h["From"]
    )
    response.deliver!
  end

  private

  def permitted_params
    params.permit(:ToCountry, :ToState, :SmsMessageSid, :NumMedia, :ToCity, :FromZip, :SmsSid, :FromState, :FromCity, :Body, :FromCountry, :To, :ToZip, :NumSegments, :MessageSid, :AccountSid, :From, :ApiVersion, :SmsStatus)
  end
end
