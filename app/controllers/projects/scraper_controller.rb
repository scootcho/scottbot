class Projects::ScraperController < ApplicationController
require 'csv'
require 'nokogiri'
require 'open-uri'

  def index
     @scrape = params[:scrape]
  end

  def create
    @scrape = params[:scrape][:url]

    @doc = Nokogiri::HTML(open("#{@scrape}"))

    @words = Array.new
    @defs = Array.new

    @doc.css('span.qWord.lang-en').each do |word|
      @words << word.text
    end

    @doc.css('span.qDef.lang-en').each do |definition|
      @defs << definition.text
    end

    csv_string = CSV.generate do |csv|
      csv << ["WORD", "DEFINITION"]
      csv << ["",""]

      (0..@words.length - 1).each do |index|
        csv << [ @words[index], @defs[index] ]
      end
    end

   #Sending data to browser
   send_data csv_string,
   :type => 'text/csv; charset=iso-8859-1; header=present',
   :disposition => "attachment; filename=flashcards.csv" 
  end

end
