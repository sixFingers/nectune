require 'feed_detector'
require 'feedjira'

class SourcesController < ApplicationController
  before_action :set_source, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

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

    if params[:lookup_url]
      @feed_urls = FeedDetector.fetch_feed_urls(params[:lookup_url])
      if @feed_urls.count > 0
        feeds = Feedjira::Feed.fetch_and_parse(@feed_urls)

        feeds.each do |key, value|
          @sources << Source.new(name: value.title, url: value.url, feed_url: key)
        end
      end
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
        @source = Source.new(name: source['name'], url: source['url'], feed_url: source['feed_url'], author: current_user)
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
