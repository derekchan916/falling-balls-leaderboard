class LeadersController < ActionController::Base
  def create
    leader = Leader.new(leader_params)
    user = Leader.find_by(name: leader.name)

    if leader.score < 10000
      if user && (user.score < leader.score)
        user.update!(score: leader.score)
      elsif !user
        leader.save
      end
      @leaders = Leader.all.order(score: :desc).limit(8)

      render json: @leaders
    end
  end

  def index
    @leaders = Leader.all.order(score: :desc).limit(8)

    render json: @leaders
  end

  def all
    @leaders = Leader.all.order(score: :desc)

    render json: @leaders
  end

  private

  def leader_params
    params.permit(:name, :score)
  end
end
