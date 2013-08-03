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

  #callbacks
  after_create :update_answers_count

  def update_answers_count
    #write_attribute(:answers_count, self.answers.size) 
    Poll.collection.update( {'_id' => self._parent._id}, 
                              {'$inc' => {'answers_count' => 1}},{:updated_at=>Time.now.utc} )
  end


end