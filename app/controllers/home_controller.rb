class HomeController < ApplicationController
  def index
    Resque.enqueue(FeedScraper)
  end
end
