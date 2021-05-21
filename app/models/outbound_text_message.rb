class OutboundTextMessage

  include Mongoid::Document
  include TextMessage::Delivery

  field :message_body, type: String
  field :recipient_number, type: String
  field :delivered, type: Boolean

end