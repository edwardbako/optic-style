class GramsController < ApplicationController
  before_action :set_page, only: [:index, :show]

  def index
    grams = Gram.all.order(created_at: :desc).limit(page_size)
    set_grams_from_collection grams
    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    @gram = Gram.find(params[:id])
    respond_to do |format|
      format.html
    end
  end

  private

  def set_grams_from_collection(collection)
    @grams = collection.offset(@page * page_size)
    @next_page_size = collection.offset((@page + 1) * page_size).count
  end

  def page_size
    6
  end

end