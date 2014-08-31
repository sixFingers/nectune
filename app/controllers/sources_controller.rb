require 'feed_detector'
require 'feedjira'

class SourcesController < ApplicationController
  before_action :set_source, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  include SourcesHelper

  # GET /sources
  # GET /sources.json
  def index
    @sources = Source.all
  end

  # GET /sources/1
  # GET /sources/1.json
  def show
  end

  # GET /sources/lookup
  # POST /sources/lookup
  def lookup

  end

  # GET /sources/new
  def new
    @sources = []
    errors = false

    if params[:lookup_url]
      lookup_url = normalize_url(params[:lookup_url])
      @feed_urls = FeedDetector.fetch_feed_urls(lookup_url)
      if @feed_urls.count > 0
        @feed_urls.each do |feed_url|
          if valid_url?(feed_url)
            feed = Feedjira::Feed.fetch_and_parse(feed_url)
            puts feed.description
            if Feedjira::Parser.const_defined?(feed.class.to_s.demodulize)
              @sources << Source.new(title: feed.title, url: feed.url, feed_url: feed_url, description: feed.description)
            else
              error = true
            end
          else
            error = true
          end
        end
      else
        error = true
      end
    end

    if error
      flash[:notice] = 'Impossible to extract a valid feed.'
    end
  end

  # GET /sources/1/edit
  def edit
  end

  # POST /sources
  # POST /sources.json
  def create
    if params['sources']
      params['sources'].each do |source|
        @source = Source.new(title: source['title'], url: source['url'], feed_url: source['feed_url'], description: source['description'], author: current_user)
        if(!@source.save)
          flash[:notice] = 'One or more feeds were already available.'
        end
      end
    end

    redirect_to sources_path
  end

  # PATCH/PUT /sources/1
  # PATCH/PUT /sources/1.json
  def update
    respond_to do |format|
      if @source.update(source_params)
        format.html { redirect_to @source, notice: 'Source was successfully updated.' }
        format.json { render :show, status: :ok, location: @source }
      else
        format.html { render :edit }
        format.json { render json: @source.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sources/1
  # DELETE /sources/1.json
  def destroy
    @source.destroy
    respond_to do |format|
      format.html { redirect_to sources_url, notice: 'Source was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_source
      @source = Source.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def source_params
      params.require(:source).permit(:url, :lookup)
    end
end
