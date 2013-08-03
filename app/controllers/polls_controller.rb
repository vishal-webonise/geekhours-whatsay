class PollsController < ApplicationController
  def index
    @my_polls = current_user.polls
    @top_polls = Poll.top_polls
    @latest_polls = Poll.latest_polls
  end

  def new
    @poll = current_user.polls.new #TODO use current_user
    #@vote_poll = @poll.build_vote_poll
    #@suggestion_poll = @poll.build_suggestion_poll
  end

  def create

  end

  def show

  end
end
