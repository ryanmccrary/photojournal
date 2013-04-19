class ProfilesController < ApplicationController
  def show
  	@user = User.find_by_profile_name(params[:id])
  	if @user
  		@entries = @user.entries.all
  		render action: :show
  	else
  		render file: 'public/nouser', status: 404, formats: [:html]
  	end
  end
end
