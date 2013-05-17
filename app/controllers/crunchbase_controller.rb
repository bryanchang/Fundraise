require 'crunchbase'

class CrunchbaseController < ApplicationController

  def graph

    Crunchbase::API.key = 'vr3yz4kad3h4ptu6k9c7zce9'
    @steve_jobs = Crunchbase::Person.get("steve-jobs")
    @facebook = Crunchbase::Company.get("facebook")
    facebook_funding_rounds = @facebook.funding_rounds
    puts facebook_funding_rounds
    # s = Crunchbase::Search.find("wearable computing")

    # chart_data = {}
    # facebook_funding_rounds.each do |f|
    #   puts f.inspect
    #   chart_data[f['funded_year']] = f['raised_amount']
    # end

    chart_data = facebook_funding_rounds.reduce({}) do |h, f|
      h[f['round_code']] = f['raised_amount']/1000000
      h
    end




    render json: chart_data

  end

end