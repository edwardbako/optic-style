class PostsController < ApplicationController
  before_action :set_page, only: [:index]

  def index
    @posts = Post.all.order(created_at: :desc).limit(page_size).offset(@page * page_size)
    @next_page_size = Post.all.limit(page_size).offset((@page + 1) * page_size).count

    @titles_list += ['Новости']
    respond_to do |format|
      format.html
      format.js
    end
  end

  private

  def page_size
    6
  end
end