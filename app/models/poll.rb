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

  attr_accessible :topic,:description,:type, :field_options,:answers_count,:updated_at, :multiple_ans

  #fields
  field :topic,          :type => String
  field :description,    :type => String
  field :type,           :type => String
  field :field_options,  :type=> Array,    :default=> []
  field :multiple_ans,   :type => Boolean,:default=>false
  field :answers_count,   :type => Integer,:default=>0 

  #options => array [{option_value => "Yes", votes: "0"}, {}, {}]

  #validations
  validates :topic, :presence => true


  scope :answered_by, ->(user,poll) { where("answers.user_id" => user.id,:_id=>poll.id) }

  #callbacks
  #after_update :save_count

  def self.get_by_id(id)
    Poll.where(:_id=>id).first
  end

  def user_mark(rater)
    r = self.rating_marks.where(:rater_id => rater.id, :rater_class => rater.class.to_s).first
    r ? r.mark : nil
  end

  def self.top_polls
    Poll.all.sort_by{|poll| poll.answers_count}
  end

  def self.latest_polls
    Poll.all.sort_by{|poll| poll.updated_at.to_i}
  end

  def answered_by?(user)
    Poll.answered_by(user,self).to_a.size >= 1
  end
  # def save_count
  #   write_attribute(:answers_count, self.answers.size) 
  # end
end
