class OutboundTextMessage < ApplicationDocument
  include TextMessage::Delivery

  field :message_body, type: String
  field :media_url, type: Array
  field :recipient_number, type: String
  field :delivered, type: Boolean

end