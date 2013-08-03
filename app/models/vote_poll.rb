class VotePoll
  include Mongoid::Document
  include Mongoid::Timestamps

  #associations
  belongs_to :poll 
  embeds_many :answers
  #attr_accessible
  #attr_accessible 

  #fields
  field :multiple_ans,    :type => Boolean,:default=>false
  field :field_options,    :type=> Array,    :default=> []
end
