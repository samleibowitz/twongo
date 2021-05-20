class InboundTextMessage

  include Mongoid::Document
  include Mongoid::Attributes::Dynamic
  
  field :raw_data, type: Hash
end