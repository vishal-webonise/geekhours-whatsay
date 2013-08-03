class SuggestionPoll
  include Mongoid::Document
  include Mongoid::Timestamps

  #associations
  belongs_to :poll 
  #attr_accessible
  attr_accessible :field_options


  #field :field_options,    :type=> Array,    :default=> []
end
