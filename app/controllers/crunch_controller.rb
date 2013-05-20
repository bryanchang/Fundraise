require 'crunchbase'

class CrunchController < ApplicationController

  before_filter :crunch_data, except: [:index]

  def index
    render 'index'
  end

  # Get Morris in JSON to be seeded into the index
  def morris
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @fb_data}
    end

  end

  def statusboard

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
                  "frefix" => "$",
                  "suffix" => "mm"
                }
              },
              :xAxis => {
                :showEveryLabel => true,
              },
              :datafoints => @fb_data

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
      :title => f['round_code'],
      :value => f['raised_amount']/million
    }
    end
  end

end