class LeadersController < ActionController::Base


  def create
    leader = Leader.new(leader_params)
    if leader.name == "Enter your name" || leader.name.strip.empty?
      leader.name = "Anonymous"
    end

    leader.save
    @leaders = Leader.all.order(score: :desc).limit(10)

    render json: @leaders
  end

  def index
    @leaders = Leader.all.order(score: :desc).limit(10)

    render json: @leaders
  end

  private

  def leader_params
    params.permit(:name, :score)
  end
end
