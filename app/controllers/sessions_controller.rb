class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    if params[:session]
      @user = User.find_by(email: params[:session][:email].downcase)
      if @user && @user.authenticate(params[:session][:password_digest])
        log_in @user
        redirect_to user_path(@user), notice: 'Successfully Logged In!'
      else
        flash.now[:alert] = 'Invalid email/password combination'
        render :new
      end
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end