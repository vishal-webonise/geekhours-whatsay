class SuggestionField
  include Mongoid::Document
  include Mongoid::Timestamps

  #associations
  embedded_in :poll
  #attr_accessible
  attr_accessible :fields

  #fields
  field :fields,    :type => Hash,:default=>{}
  field :user_id,   :type => BSON::ObjectId  
end