
class PostsController < BaseController
  def index
    @posts = Post.all
    render "posts/index.html.erb"
  end

  def show
    @post = Post[params["id"]]
    render "posts/show.html.erb"
  end

  def delete
    post = Post[params['id']]
    post.delete
    redirect_to "/posts"
  end

  def new
     render "posts/new.html.erb"
  end

  def create
     Post.create(title: params["title"],
                 content: params["content"],
                 date: Time.now.to_i)
    redirect_to "/posts"
  end

  def edit
    @post = Post[params["id"]]
    render "posts/edit.html.erb"
  end

  def update
    @post = Post[params["id"]]
    Post.update(title: params["title"],
                content: params["content"])
    redirect_to "/posts"
  end

  private

  def redirect_to(path)
    [303, {'Location' => path}, ['303 See Other']]
  end
end