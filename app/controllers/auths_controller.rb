class AuthsController < ApplicationController

  def create
    puts "#{params}"
    render json: {msg: "OK"}
  end

end
