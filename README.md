# Watcha clone app
fake 왓챠 based on rails
---
## 1. 영화 정보(Movie)
- model : Movie
- controller : movies
- 관리자: CRUD
- 로그인 된 유저 : 점수을 줄 수 있다, 댓글도 달 수 있다.
- 댓글(Comment)

## 2. 게시판(Post -> Scaffold)
- Scaffold: `rails g scaffold Post [옵션]`
- title:string, content:text, user_id:integer
- User has_many :posts
- Post belongs_to :user
- 로그인 안된 유저: R
- 로그인 된 유저: CRUD(본인의 글)

- 관리자: CRUD(모든 글)
- 댓글(Comment)

## 3. 유저(User -> Devise)
- signup, login, ... (O)
- 관리자/일반유저 (O)
- 한글 버전
- view 수정 가능
- nickname이라는 칼럼을 추가함
  * 추가방법
    1. devise 모델을 수정 `db/migrate/XXXXXXX_devise_create_users.rb`
```ruby
t.string :nickname,           null: false, default: ""

```
    2. `app/controller/application_controller.rb`에 아래 코드 추가
```ruby
class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname]) # 추가할 유저 정보를 keys: [] 배열 안에 넣어준다.
  end
end
```
