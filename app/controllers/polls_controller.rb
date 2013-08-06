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
    logger.info ".........>>#{params.inspect}"
    poll = current_user.polls.create({
      :topic         => params[:poll][:topic],
      :description   => params[:poll][:description],
      :type          => params[:poll][:type],
      :multiple_ans  => params[:poll][:multiple_ans],
      :field_options => params[:poll][:field_options].values
      })
  rescue => e
    logger.error "Error: #{e.message} \n #{e.backtrace.join('\n')}"
    render :new
  else
    # success
    redirect_to poll_path(poll)
  end

  def show
    @poll = Poll.find(params[:id])
  end

  def update
    print_logger_info "#{params} #{params[:answers].class}"
    @poll = Poll.get_by_id(params[:id])
    params[:answers].is_a?(String) ? answers = [params[:answers]]  : answers = params[:answers].reject!{|key,value| value=="0"}.values
    @poll.answers.create(:choice => answers, user_id: current_user.id)
    redirect_to :polls, :notice => "Your vote is submitted."
  end
end
