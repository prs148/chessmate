# frozen_string_literal: true

class StaticPageController < ApplicationController
  def index
    @games = Game.available
    @started = Game.all 
  end
end
