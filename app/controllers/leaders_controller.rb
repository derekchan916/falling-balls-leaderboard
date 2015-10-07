class LeadersController < ActionController::Base
  def create
    leader = Leader.new(leader_params)
    user = Leader.find_by(name: leader.name)

    if user && (user.score < leader.score)
      user.update!(score: leader.score)
      @leaders = Leader.all.order(score: :desc).limit(8)
    elsif !user
      leader.save
      @leaders = Leader.all.order(score: :desc).limit(8)
    end

    render json: @leaders
  end

  def index
    @leaders = Leader.all.order(score: :desc).limit(8)

    render json: @leaders
  end

  private

  def leader_params
    params.permit(:name, :score)
  end
end
