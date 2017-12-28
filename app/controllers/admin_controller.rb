class AdminController < ApplicationController
  def index
    @users = User.all
  end

  def posts
    @posts = Post.all
  end

  def posts_destroy
    # 특정 게시글을 지운다.
  end

  def reviews
    @reviews = Review.all
  end

  def reviews_destroy
    # 특정 리뷰를 지운다.
  end

  def to_manager
    @user = User.find(params[:id])
    @user.update(
      role: "manager"
    )
    redirect_to :back, notice: "매니저로 승급되었습니다."
  end

  def to_user
    @user = User.find(params[:id])
    @user.update(
      role: "user"
    )
    redirect_to :back, notice: "양민으로 만들었습니다."
  end
end
