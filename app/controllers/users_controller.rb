class UsersController < ApplicationController

before_filter :signed_in_user, only: [:index, :edit, :update, :destroy, :following, :followers, :create_comment]
before_filter :correct_user, only: [:edit, :update]
before_filter :admin_user, only: :destroy

  def index
    @users = User.paginate(page: params[:page])
  end  

  def show
  	@user = User.find(params[:id])
    @microposts = @user.microposts.paginate(page: params[:page])
  end

  def new
  	@user = User.new
  end

  def create 
  	@user = User.new(params[:user])
  	if @user.save
      sign_in @user 
  		flash[:success] = "Welcome to MicroText"
  		redirect_to @user
  	else
  		render 'new'
  	end
  end

  def edit
    
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      sign_in @user
      flash[:succeess] = "Profile updated succeessfully!"
      redirect_to @user
    else
      render 'edit'
    end 
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:succeess] = "User has been deleted succeessfully !"
    redirect_to users_path
  end

  def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.followed_users.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end

  def create_comment
    logger.debug "===#{params.inspect}"
    logger.debug "===#{current_user.inspect}"
      
    if current_user.nil?
        redirect_to root_url, :notice => "Please login to comment"
        return
    else
      comment = Comment.new
      comment.content = params[:comment]
      comment.micropost_id = params[:micropost_id]
      comment.username = current_user.name
      if comment.save
        respond_to do |format|
          format.js
        end
      else
        render text: comment.errors.to_json
        return
      end
    end
    
  end

  def search_users
    @users = User.where('name LIKE ?', "%#{params[:username]}%").paginate(page: params[:page]) if params[:username].present?
    @notice = "please enter a username" unless params[:username].present?
    respond_to do |format|
      format.html
    end
  end

  def recommended_friends
    followers = current_user.followers
    followed = current_user.followed_users
    unless followers.blank?
      followed_id_collection = followed.collect{ |followed| followed.id}
      @recommended_friends = []
      followers.each do |follower|
        tmp_followers = follower.followers
        unless tmp_followers.blank?
          tmp_recommends = tmp_followers.collect{|follower| follower.id}
          @recommended_friends.push(tmp_followers)
        end
      end
      @recommended_friends = @recommended_friends.flatten! - followed_id_collection
      @recommended_friends = @recommended_friends.sample(3)
    end
  end


private


def correct_user
  @user = User.find(params[:id])
  redirect_to root_path unless current_user?(@user)
end

def admin_user
  redirect_to root_path unless current_user.admin?
end

end
 

 