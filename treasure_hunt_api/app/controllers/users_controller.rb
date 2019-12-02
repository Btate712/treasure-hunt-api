class UsersController < ApplicationController
  skip_before_action :authenticate_request, only: %i[login register]
 # POST /register
  def register
    user = User.create(user_params)
    if user.save
      response = { message: 'User created successfully' }
      render json: response, status: :created
    else
      render json: user.errors, status: :bad
    end
  end

  def login
    authenticate params[:name], params[:password]
  end

  def test
    render json: {
          message: 'You have passed authentication and authorization test'
        }
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    if user.save
      render json: { status: "success", message: "updated user with id:#{user.id}" }
    else
      render json: { status: "fail", message: "could not update user" }
    end
  end

  def destroy
    if user = User.find(params[:id])
      user.destroy
      render json: { status: "success", message: "user destroyed" }
    else
      render json: { status: "fail", message: "could not find user" }
    end
  end

  private

  def authenticate(name, password)
    command = AuthenticateUser.call(name, password)

    if command.success?
      render json: {
        access_token: command.result,
        message: 'Login Successful'
      }
    else
      render json: { error: command.errors }, status: :unauthorized
    end
  end

  def user_params
    params.permit(
      :name,
      :email,
      :password
    )
  end
end
