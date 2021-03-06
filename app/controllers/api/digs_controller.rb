class Api::DigsController < ApplicationController

  before_action :authenticate #list your actions in except array where you don't want to check for current user


  def index
    render json: Dig.all
  end

  def show
    render json: Dig.find(params[:id])
  end

  def create
    render json: current_user.digs.create!(dig_params)
  end

  def update
    dig = Dig.find(params[:id])
    dig.update!(dig_params)

    render json: dig
  end

  def destroy
    dig = Dig.find(params[:id])
    dig.destroy!

    head 200
  end

  def vote
    dig = Dig.find(params[:id])
    random_user = User.all.sample(1).first
    dig.votes.create! amount: params[:vote], voter: random_user

    head 200
  end

  def comments
    dig = current_user.digs.find(params[:id])

    render json: dig.comments
  end

  def comment
    render json: Comment.find(params[:comment_id])
  end

  private
    def dig_params
      params.require(:dig).permit(:title, :body)
    end

    def authenticate
    redirect_to root_path, notice: "You must login first" if !current_user  # if current user doesn't exist it will redirect to your path with notice
  end
end

