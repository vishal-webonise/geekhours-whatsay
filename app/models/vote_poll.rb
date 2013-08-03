class VotePoll
  include Mongoid::Document
  include Mongoid::Timestamps

  #associations
  belongs_to :poll 
  #attr_accessible
  #attr_accessible 

  #fields
  fields :multiple_ans,    :type => Boolean,:default=>false
  field :options,   		   :type=> Hash,    :default=> {}
end
