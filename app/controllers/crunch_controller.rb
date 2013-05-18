require 'crunchbase'

class CrunchController < ApplicationController

  before_filter :crunch_data, except: [:index]

  def index
    render 'index'
  end

  # Get Morris in JSON to be seeded into the index
  def morris
    render :json => @fb_data
  end

  def statusboard

    # fb_data = {}
    # facebook.each do |f|
    #   fb_data[f['round_code']] = f['raised_amount']/million
    # end

    # fb_data = @facebook.reduce do |h, f|
    #   h[f['round_code']] = f['raised_amount']/million
    #   h
    # end

    chart_data =
    {
      :graph => {
          :title => "FB Billion Dollar Club Funding History",
          :datasequences => [
            {
              :title => "Facebook",
              :color => "blue",
              :yAxis => {
                :showEveryLabel => true,
                :minValue => 0,
                :maxValue => 250,
                :units => {
                  "prefix" => "$",
                  "suffix" => "mm"
                }
              },
              :xAxis => {
                :showEveryLabel => true,
              },
              :datapoints => @fb_data

              # [
                  # { "title" => "Angel", "value" => @fb_data["angel"]},
                  # { "title" => "A", "value" => @fb_data["a"]},
                  # { "title" => "B", "value" => @fb_data["b"]},
                  # { "title" => "C", "value" => @fb_data["c"]},
                  # { "title" => "Debt Round", "value" => @fb_data["debt_round"]},
                  # { "title" => "D", "value" => @fb_data["d"]},
                  # { "title" => "Venture Round", "value" => @fb_data["unattributed"]},
                  # @facebook.each do |f|
                  # { "title" => "#{f['round_code']}", "value" => "#{f['raised_amount']/1000000}"}
                  # { "title" => "#{@facebook.map{|f| f['funded_year']}}", "value" => "#{@facebook.map{|f| f['raised_amount']/1000000}}"}
              # ]
            }
          ]

      }
    }

    render json: chart_data

  end

  private

  def crunch_data
    million = 1000000
    cb = Crunch.new
    facebook = cb.fetch('facebook')
    fb_fundraise = facebook.funding_rounds
    @fb_data = fb_fundraise.map do |f| {
      :title => f['round_code'],                # needs to be enumerable
      :value => f['raised_amount']/million     # needs to be enumerable
    }
    end
  end

end


    # startups = [
    #   "facebook",
    #   "linkedin",
    #   "twitter",
    #   "dropbox",
    #   "pinterest",
    #   "airbnb",
    #   "instagrm"]
