require 'crunchbase'

class CrunchbaseController < ApplicationController

  def graph

    Crunchbase::API.key = 'vr3yz4kad3h4ptu6k9c7zce9'
    # @steve_jobs = Crunchbase::Person.get("steve-jobs")

    # bn_startups = [
    #   "facebook",
    #   "linkedin",
    #   "twitter",
    #   "dropbox",
    #   "pinterest",
    #   "airbnb",
    #   "instagrm"]

    # bn_startup_funding =  bn_startups.map do |startup|
    #   Crunchbase::Company.get(startup).funding_rounds
    # end

    @facebook = Crunchbase::Company.get("facebook").funding_rounds
    @twitter = Crunchbase::Company.get("twitter").funding_rounds
    @pinterest = Crunchbase::Company.get("pinterest").funding_rounds

    fb_data = {}
    @facebook.each do |f|
      puts @facebook.inspect
      fb_data[f['round_code']] = f['raised_amount']/1000000
    end

  #    @facebook_rounds = @facebook['round_code']

    # fb_data = @facebook.reduce do |h, f|
    #   h[f['round_code']] = f['raised_amount']/1000000
    #   h
    # end

    twitter_data = {}
    @twitter.each do |t|
      twitter_data[t['round_code']] = t['raised_amount']/1000000
    end

    p_data = {}
    @pinterest.each do |p|
      p_data[p['round_code']] = p['raised_amount']/1000000
    end

    #render json: fb_data

    render json:

    {
      "graph" => {
          "title" => "FB Billion Dollar Club Funding History",
          "datasequences" => [
            {
              "title" => "Facebook",
              "color" => "blue",
              "yAxis" => {
                "minValue" => 0,
                "maxValue" => 250,
                "units" => {
                  "prefix" => "$",
                  "suffix" => "mm"
                }
              },
              "datapoints" => [
                  { "title" => "Angel", "value" => fb_data["angel"]},
                  { "title" => "A", "value" => fb_data["a"]},
                  { "title" => "B", "value" => fb_data["b"]},
                  { "title" => "C", "value" => fb_data["c"]},
                  {"title" => "debt round", "value" => fb_data["debt_round"]},
                  {"title" => "d", "value" => fb_data["d"]},
                  {"title" => "unattributed", "value" => fb_data["unattributed"]},
                  # @facebook.each do |f|
                  # { "title" => "#{f['round_code']}", "value" => "#{f['raised_amount']/1000000}"}
                  # { "title" => "#{@facebook.map{|f| f['funded_year']}}", "value" => "#{@facebook.map{|f| f['raised_amount']/1000000}}"}
              ]
            }
            #             {
            #   "title" => "Twitter",
            #   "color" => "aqua",
            #   "yAxis" => {
            #     "units" => {
            #       "prefix" => "$",
            #       "suffix" => "mm"
            #     }
            #   },
            #   "datapoints" => [
            #       { "title" => twitter_data, "value" => twitter_data}
            #       # @facebook.each do |f|
            #       # { "title" => "#{f['round_code']}", "value" => "#{f['raised_amount']/1000000}"}
            #       # { "title" => "#{@facebook.map{|f| f['funded_year']}}", "value" => "#{@facebook.map{|f| f['raised_amount']/1000000}}"}
            #   ]
            # },
            #             {
            #   "title" => "Pintrest",
            #   "color" => "red",
            #   "yAxis" => {
            #     "units" => {
            #       "prefix" => "$",
            #       "suffix" => "mm"
            #     }
            #   },
            #   "datapoints" => [
            #       { "title" => p_data, "value" => p_data}
            #       # @facebook.each do |f|
            #       # { "title" => "#{f['round_code']}", "value" => "#{f['raised_amount']/1000000}"}
            #       # { "title" => "#{@facebook.map{|f| f['funded_year']}}", "value" => "#{@facebook.map{|f| f['raised_amount']/1000000}}"}
            #   ]
            # }

          ]

      }
    }

  end

end