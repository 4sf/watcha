# Watcha clone app
fake 왓챠 based on rails
---
## 0. 영화 정보(Movie)
- model : Movie(title, poster, genre, nation, director)
- controller : movies
- movies#index (모든 영화를 보여주는 root page)
- movies#show (하나의 영화를 상세히 보여주는 page)
- CRUD
- 관리자만 가능하게 만든다.

## 1. 영화 Review
- 로그인 된 유저 : 점수을 줄 수 있다, comment도 달 수 있다.
- 평점 - rating: integer
- 코멘트 - comment: string
- user_id
- movie_id
- Movie has_many :reviews
- Review belongs_to :movie
- User has_many :reviews
- Review belongs_to :user

## 2. 게시판(Post -> Scaffold)
- Scaffold: `rails g scaffold Post [옵션]`
- title:string, content:text, user_id:integer
- User has_many :posts
- Post belongs_to :user
- 로그인 안된 유저: R
- 로그인 된 유저: CRUD(본인의 글)
- 관리자: CRUD(모든 글) (X)
- 댓글(Comment) (X)

## 3. 유저(User -> Devise)
- signup, login, ...
- 관리자/일반유저
- 한글 버전
- view 수정 가능
- nickname이라는 칼럼을 추가함
#### 추가방법
##### 1. devise 모델을 수정 `db/migrate/XXXXXXX_devise_create_users.rb`
```ruby
class DeviseCreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      ...
      # nickname 칼럼 추가
      t.string :nickname, null: false, default: ""

      ...
    end
  end
end
```
##### 2. `app/controller/application_controller.rb`에 아래 코드 추가
```ruby
class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname]) # 추가할 유저 정보를 keys: [] 배열 안에 넣어준다.
  end
end
```

## 4. 사진 업로드

## 5. 유저 역할 구분 / 관리자 페이지
- User model -> :role, :string, default: "user"
- role = ["user", "manager", "admin"] (유저는 3개의 역할군으로 나눠져 있다.)
- 
