class Crunch

  # attr_accessible :data

  def initialize
  end

  def fetch(company)
    Crunchbase::API.key = ENV['CB_API_KEY']
    data = Crunchbase::Company.get(company)
  end

end