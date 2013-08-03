class Poll
  include Mongoid::Document
  include Mongoid::Timestamps

  #associations
  belongs_to :user
  has_one :suggestion_poll, :dependent => :destroy
  has_one :vote_poll, :dependent => :destroy
  #attr_accessible
  attr_accessible :topic

  #fields
  field :topic,          :type => String
  field :description,    :type => String
  field :type,           :type => String 

  #validations
  validates :topic, :presence => true
end
