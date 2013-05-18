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