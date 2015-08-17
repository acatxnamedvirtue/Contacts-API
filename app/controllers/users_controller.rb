class UsersController < ApplicationController
  def index
    # render text: "I'm in the index action!"
    # obj = Object.new
    # render json: obj.to_json

    render json: User.all
  end

  def show
    render json: User.find(params[:id])
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user
    else
      render(
        json: user.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def update
    user = User.update(params[:id], user_params)
    render json: user
  end

  def destroy
    user = User.destroy(params[:id])
    render json: user
  end

  private

    def user_params
      params[:user].permit(:name, :email)
    end
end
