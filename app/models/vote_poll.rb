class VotePoll
  include Mongoid::Document
  include Mongoid::Timestamps

  #associations
  belongs_to :poll 
  embeds_many :answers
  #attr_accessible
  attr_accessible :multiple_ans, :field_options

  #fields
  field :multiple_ans,    :type => Boolean,:default=>false
  field :field_options,    :type=> Array,    :default=> []
end
