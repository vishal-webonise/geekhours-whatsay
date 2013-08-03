class Poll
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Rateable
  RATING_RANGE = (1..5)

  #associations
  belongs_to :user
  #has_one :suggestion_poll, :dependent => :destroy
  #has_one :vote_poll, :dependent => :destroy
  embeds_many :suggestion_field
  embeds_many :answers

  #attr_accessible
  attr_accessible :topic,:description,:type, :field_options

  #fields
  field :topic,          :type => String
  field :description,    :type => String
  field :type,           :type => String 
  field :field_options,  :type=> Array,    :default=> []
  field :multiple_ans,    :type => Boolean,:default=>false

  #options => array [{option_value => "Yes", votes: "0"}, {}, {}]

  #validations
  validates :topic, :presence => true

  def user_mark(rater)
    r = self.rating_marks.where(:rater_id => rater.id, :rater_class => rater.class.to_s).first
    r ? r.mark : nil
  end
end
