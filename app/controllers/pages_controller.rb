require 'open-uri'
require 'nokogiri'

class PagesController < ApplicationController

  before_action :set_page, only: [:show, :destroy]

  def index
    @pages = Page.all
    json_response({ pages: @pages.as_json(include: :contents) })
  end

  def create
    @page = Page.create!(create_params)
    parse_page_contents()
    json_response(@page.as_json(root: true, include: :contents), :created)
  end

  def show
    json_response(@page.as_json(root: true, include: :contents))
  end

  def destroy
    @page.destroy
    head :no_content
  end

  private

  def set_page
    @page = Page.find(params[:id])
  end

  def create_params
    params.require(:page).permit(:url)
  end

  def parse_page_contents
    html = open(@page.url)
    doc = Nokogiri::HTML(html)

    doc.css('h1, h2, h3, a').each do |el|
      @page.contents.create!({
        kind: el.name,
        value: el.text.strip
      })
    end

  end

end
