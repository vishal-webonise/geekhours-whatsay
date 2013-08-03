class Answer
  include Mongoid::Document
  include Mongoid::Timestamps

  #associations
  embedded_in :vote_poll
  #attr_accessible
  attr_accessible :choice

  #fields
  field :choice,    :type => String
  field :user_id,   :type => BSON::ObjectId  
end