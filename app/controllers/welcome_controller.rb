class WelcomeController < ApplicationController

  def index

  end

  def contacts
    @id = params[:id].to_i
  end

end