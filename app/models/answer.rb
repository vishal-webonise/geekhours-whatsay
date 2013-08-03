class Answer
  include Mongoid::Document
  include Mongoid::Timestamps

  #associations
  embedded_in :poll
  #attr_accessible
  attr_accessible :choice, :user_id

  #fields
  field :choice,    :type => String
  field :user_id,   :type => BSON::ObjectId
end